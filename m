Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E61C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZ7wIET9+cqj/SQgvihtveMHAe4vfB83eDliegEyhsY=; b=IOtOYoC9U2Ts1x
	jQBZ+buLdHjy9MnDQLUW5CK/N0cC1ZL3SQMm8Lutq+08xb9oYtdCxH7pehee6/e0HSoIWWhOVSrMq
	K1kz0bvlFbwzi9h3rFIe+Kmd3XKAYBx60ehhh+HxBteJ0JRuEe/zImI+xOgOxjMiuzm8990dFZ8Rl
	3GlIdNEzBgpZnnA8j51XJSDdAzhTFW4oo9TFg4b2NElGL3BcgrE4tJMpaHBIBpHcUge8IY53oyOBw
	A5WDQRF769Fngh7LpLafZ5VUoHdN4iG9KtJJhTIzkiPRYNeyrbcLTapX4sNmvq+hkayiPUUHMytN0
	M4GdX+nPBIEer+eOHFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprMm-0000000DHq6-17ZH;
	Fri, 31 Jul 2026 17:49:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprMi-0000000DHoZ-4B1C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:49:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFONhe489212
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 17:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IZ7wIET9+cqj/SQgvihtve
	MHAe4vfB83eDliegEyhsY=; b=b993d4/aZJpuvvVA6efnhCvWzpxkQ7/uLfWry6
	H7T2G383OaSZiF1UdcZdAriLf4gHKXDC0HX14ULRkFfgGnIGZo1hJyyZCgUVxxEI
	/RjliK1KyIvuoRiLt6uRf1QG7IpKSnrtJiNiUox6gHQABO5DhBoUs01jnZzFUp05
	Y+lYI0xNGfo+xR8gpD2xzqP1rzYEdK2PpUbkUhVcw8+AdpBcclh5PXoqhFQPKttc
	zJZNXkdMdUbRpnCwvMX+H3zULq9kUJjshWmw6eL5P46Jg435D0u/3MXcRlZHik6T
	gUwy00Gl3vNrjZa/lUTNjJ7vVYoj8PhwIUJ5tisMZ0jVhaJQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8skrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 17:49:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2891040b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785520182; x=1786124982; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IZ7wIET9+cqj/SQgvihtveMHAe4vfB83eDliegEyhsY=;
        b=YzjM25Dnx9uHK5/U+1aFP0CFe2eEPr5Rk/5TRB5W5zTUHTVt1GzMSANCPyi700KAMZ
         GGR6Ltm2PIDiLwd5yFiJ0HE/XyU+Bqztsa6AzbafrcKgLeETBkI6E5G7jDOxIFIMwe9M
         myyiJ7W5MK2z1wDhJFtALU7sr54FPGaZrPoA1Kuv6Go4nkJyfUGa00JwdexoK1at7z16
         aycT0YAsTuB/5nVUOx6NQvC9qMm/Qtcz3sCmtK6Hnnp1h0zGEehgs+jUWpHe+j8PCOtd
         gbQWl5WkkAY/FW33NCkdREmiQ5hcJfooHQey64/r8s/ISN/UQd67cCl2WOxjT97xfe4J
         NVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520182; x=1786124982;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IZ7wIET9+cqj/SQgvihtveMHAe4vfB83eDliegEyhsY=;
        b=VzEWozWbGu0PiikjVBc6TvRZJbW0fXP/Q1/yGD5Z8eptq1nSCX24RKh7snRPmbs4Mo
         WfKzygSlhJcgVON+h1rYc+U2f9nm+BJq++JOGyA5s0fMgci94+15ZLpfmjluv2e0Xy46
         cF6C9deedVHlw0b4Z920BnCKxHD+Mmz9IZ971qTAOTVK7tRh3hFE8y2xOiBbaCbGabXi
         46KmmOmQFk95hpOd+f2W/xsafKCW8DIPi3XpwbKpbe54KBKWA2TowNO98yREkKaPL74g
         Orlat37TDQX9VK6PsL8VumO5qhiKKkSx50eWSzr9/UZP6tobWLmOzCbZoGIHYyR3hsX3
         1biw==
X-Forwarded-Encrypted: i=1; AHgh+RpfnQ92FubA3tbvqqg46wZxqolBHuy6R2WGor7YqTPLTkTn5EDlAMSei6heGSru3oBe83bZcejVemES2CGj/gsj@lists.infradead.org
X-Gm-Message-State: AOJu0YzTzwSWk1Y2ICjkZ1FZR4RvfrgFl8aRx6GiiAyx+iyKSVpLeGiA
	JurxuXdtiQ8UrzGRpHVrBDHuQzm8c28q4Vhsn24n8fWO9YvcJsxmEmdo3ViRA6sNrQqnnIGRnrT
	mzIQDbHznc0LEzK6PhG1JNeyAoTAwlX/vuFazEArm9WReYID+ZQx11ndjtB7g4y/taAoTZXQ/zw
	9OOQ==
X-Gm-Gg: AR+sD12C8DmiKPwpNNzzCD1iBTr53tZIhbM8qg+Jblhcf4Le9t+euVuMDYK7OMAIdv/
	I2/JJik7dxFfaD6XxV8H4MHxtGzlF2IhWJYlpIJ2MAgGqIY759VZUC+KqiCVUBBOUUFpeZs1ebC
	RsZJWOEt2M5TibHOxX0T4f5iA2TZsHfE+VMysZ67rKZjpTUoZLT17MOobkDg0wEHN6uLcFDLQw/
	tO5z9ieNp4FN2NcKVIwsig0VdwoIncRhs6868A41o6XQsrU3rxsrS/bmUEDnO/LIB6wGI2zwvmh
	0ADwsz0qYdINeQvBbsaAWAnVIHvgjuk2QQnBfnpqGmfUUEV9UCHYXwazjoWfUn586cnLfde5pc3
	otXYYfAG1Ko4NGf0sePF7mRYJyQ/vJ9eO7A0V1e7btasII5lZtA==
X-Received: by 2002:a05:6300:6186:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c91a7131eemr3358358637.2.1785520181860;
        Fri, 31 Jul 2026 10:49:41 -0700 (PDT)
X-Received: by 2002:a05:6300:6186:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c91a7131eemr3358333637.2.1785520181425;
        Fri, 31 Jul 2026 10:49:41 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm15115660eec.28.2026.07.31.10.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:49:37 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Date: Fri, 31 Jul 2026 10:49:31 -0700
Message-Id: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvgbGoC/yXMQQqDMBBA0avIrB3QEKL1KuJCp6NOaaNkogji3
 U3b5Vv8f4JyEFZoshMC76Ky+IQyz4Dm3k+M8kwGUxhXVMai0kdwFU8xvHFin3JSrKyztaVHPTg
 HqV0Dj3L8vm33t27Diyl+Z3BdNy5X3hF5AAAA
X-Change-ID: 20260724-scmi-pinctrl-generics-746484c98b66
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520175; l=1273;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=kLRTAu/k6TvKUP5frxqmRIy+X+s4tGe7Bhw8g5iWvKE=;
 b=ndPkf23CG7sENbqtvlA6PegWcpgr0px+DtxwLf0FEzSdOP1cO/TW0h3LC6k0Fgp0jWq4QoVcK
 H+Vh9Scbj8nDI10jDkN+HO8zIqd8s+vzDeZMj8hmOXUWL0jsEL5iWHY
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6ce03b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_OgG2H8xwSJ4vVLhebYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX2+6oKhmqeTyb
 PSMy1OpNze6lRwVPhZjjj34qXss9wtO9VKlSvj6tot+DFboVsnZzWgLt0REXLHdma+FTEZ1b01I
 UxYaFzFdOIgUA69G9+xvOFekqgeDyF8=
X-Proofpoint-ORIG-GUID: cYcD0NvuxzMvId2OMMEIvB7-v2p2zP0z
X-Proofpoint-GUID: cYcD0NvuxzMvId2OMMEIvB7-v2p2zP0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX/0zvSwiAKDao
 E4tL+GyIAjuvwVt87ntgnqmS9iexUGIW3IQ3YBsvk3Vu104CaBWmee7E40C5nBX91sMNXWsmoe9
 vyyWcmHG3F6UmFiYqrZoDWufV7RmoPq33mN6JBgJqmkOwOn9CzNVQ+yqDpjs8tKWU0ZW5cBAHcV
 uwE1fEs+LyaeMwjk9URQVOW/eBlkwBzwHWFR4EOP48HW7dhfo8xudqJgnMJpE3mk7oUlVsNCMdX
 aUe8MFCBnN735xI8tRAVdiTjr1fOONX/pok6YAWN4KF7wng+dHSmKfWm8doQYWr9nsA7bMxP9a6
 DIlXfqqtoCMvXTauxEZwTSIB7I/v3bC9H6D7yO0b6rCDfy2eFnEmC2XPL5KWWWUoOdk85a7ZFfr
 iTVcXKQl+iBnEOlmwZKyuOGS0OtvlWgqRdagHXe/39xHVJiNPfYYv5/zBg/PUFGwtCZLI4APNW3
 KyKWRYc4yfUWzsm1LDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_104949_156304_1C3D2BD4 
X-CRM114-Status: GOOD (  10.69  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series refactors the SCMI pinctrl driver to eliminate metadata
getter callbacks to be replaced with pinctrl and pinmux generics
provided by the pinctrl core.

Previously, the driver implemented its own get_functions_count,
get_function_name, get_function_groups, get_groups_count,
get_group_name, and get_group_pins callbacks, which required
maintaining driver metadata like the functions and count.

The pinctrl core already has support to store and manage this
topology in the pinctrl_dev via its own internal radix trees.
By registering functions and groups at probe time using
pinmux_generic_add_function and pinctrl_generic_add_group, the
driver can delegate group and function metadata management to
the core.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Alex Tran (2):
      pinctrl: scmi: Replace pinmux ops get function info with generics
      pinctrl: scmi: Replace pinctrl ops get group info with generics

 drivers/pinctrl/pinctrl-scmi.c | 223 ++++++++++++++++++-----------------------
 1 file changed, 97 insertions(+), 126 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20260724-scmi-pinctrl-generics-746484c98b66

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>


