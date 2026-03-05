Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E118F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4dDUc9FKxci0scJ6kHbvIvVEUKnC5+r57TdAfo6P2A=; b=mcXH9NNh2VIhNg
	uVuIoeSEQ+jQwsXy4c2HftoX/BtdezKU15wFQDBjNuPpYpyWSnWVbxQqohhmAWLTtSzJ72FaugCJd
	rZ53fzrMfmdy84nLqU845CjwCFvvV08T0SUaA7d41467mHtyzjuLcv/aesB4onx8bPdw4MnySDq0g
	JMUy3GeU/NJfCPoCEJNE9BYnDKpAG9EfzJCI2ZJITzfI5slom5ApvtLTeW4Czykz4fIIdHcVGFDte
	nypcU6e4DsGHJGEHNXIrrZds8TEHRqRY4PuGl9ZVDFCjLES2rnScuUznvQs6WGKAlOFFbsU2bxOA5
	iybiHxyXra0cX5JlTyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5My-00000001SS1-1xT2;
	Thu, 05 Mar 2026 09:51:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Mw-00000001SRW-39BX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:51:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62598VP43473606
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l4dDUc9FKxci0scJ6kHbvI
	vVEUKnC5+r57TdAfo6P2A=; b=IjwycJozHkc4TDTOvjpyY1NZOr1UOQIcuqh7UR
	ozgyF9oYbYgSLELweLxgJ83V6jlkNpW2PDyNXVdNB/Wy7CKR55XEv2n4xINUbVyn
	nz9e32mOVSGSSQeIfZaV+RBzVgWDMiCHoLCEJHPxswmUqMNa/t7tgqaqW7v8/dNR
	Yg+KdNnUN/w3eo3Mwlg/hLt9FKJzl9jWC3O0DUTKrKbynjEW4/drwiLw2iADjrDI
	cd416GVaYbXH8os33v5xXOtZBGt6Ty9LVo+K/hj1v8BCCuZDBS1kgypTrPTi5Rio
	4ORMDo8c3R6R8kluva3E4bhznqiZiZNEOxdGUGQxywIQBn1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj184795-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:51:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so5481189785a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704305; x=1773309105; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4dDUc9FKxci0scJ6kHbvIvVEUKnC5+r57TdAfo6P2A=;
        b=Wrh2tRTJ6AmtqEpgpcwODahXu/IUpR5xypeKkTU5sQj4+5QYtBwD7k0U8tbtDb1Pz5
         hCPp8dsAY5DP4NZzh/MDMeg4JE0jXYT5SWIo/qYFsgFHnCzb/UjBgoqC03RAJrE5pMik
         3Wt2KPZmk/qs9uL3eZh8fD+VqWeTILViBA1ByPD3dfahO+9we6KMqUKB/AROanPP5G9N
         fIgjys6axPgXy23LqxDc6gAHmvHjzZzlWb8V9iQY/Sf05uC9j4ODaSWdeaaPtLjjUa3E
         lOa7ndJ+fxWR0JMqEqZYYzGGvG1qnfmkeHNIUm9wiDDNA9hKqeMAnsensTIvXoOibYz8
         0P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704305; x=1773309105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4dDUc9FKxci0scJ6kHbvIvVEUKnC5+r57TdAfo6P2A=;
        b=tkKVI2bVDsXSvSKV3iSGrDvk2TILDRr/OoEaKROPyzr0P70E60G8ntySndHCslvRGd
         e2VCrTy9KPyeH9lGzmxB1CT8b6/TzQxNvOa0LMhGKvw35DQQubm14cDW1o7EA/hVv5OU
         yaco4j7nu/7+yUGyVuBEbSBnDM5VVSgcu0IhFSbBOXF6uoktc41Pe6hv3xRHoPE2yLV/
         uOaxoQjwTC6xOoxzzxKR2EAV3tB1mIn0tvGtx1zI1+VUnbQnozVL/kK8m/b70zmN/X0k
         IJNhKYRqt6XD5RNxcpDqAjLzEXt3XIRNvlpOHoQ5s8ql+rW3+a+iRtQtD9bH7wCbEbls
         cukQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFE1LIm3pPE2hFbrHfw9jq5PwsfIFs5Wl9P4oFVVJzsa8VMfiPRHCO2zeo3gVrPUC8gBsaUmQcWoP2G64qU02E@lists.infradead.org
X-Gm-Message-State: AOJu0YwzvAGEGOp0Agkx3yphps8yBUHPoyfQMw9bWAYqmyvipnIjS8uF
	xXd9EbIElxYRKqm9HeVW1ZwYMy1TMLEd6Vl08Ra6WJpedfnlUfZDErVBTG5RY8jqTbRR+emSr0u
	TnNS/uQNbCwZtt30W/Fnx4UAIH+oAhDSB2O851oHeg1jKn5/WrYkZV/xcmKH9yjV0L+br8k2EMK
	Dhzw==
X-Gm-Gg: ATEYQzyLfwEeOOFX6LwvIudEc/Y/tduQmndaNcU5/WGWR8z7bBOIVk/dFUh3zBozL87
	cD9c7OWkLQDBlWn3B5dzw6/y5sMXAAofjYJTthO0PUrDMzMUHH6vAC70O794uUFQIDKrCMn0ZiL
	K0gX/now8Zcjp8L3KN/y7XP1dPrfUPpiF7y+WdZUFUY3lIKBfgKEG9gMrfHhzOC338c9D3M/cML
	WCG1vn80BfzOE+OyagX9t2J7820nzvpAKcyJLGyl8gFfoDRpnrDQgnvITxzBuEA1tO15qhveA0a
	KQo5H4vc1GehIGZGtC/iLnNFHuhz46DbEYht2kqmaQUwk9QiFgzwSBaPrrMP8766obOgsSP37Vd
	wyIllrJB5R6/6fombFGoBLhlFr+SN69kITdOsrvOa7wA+9MXkpiLo
X-Received: by 2002:a05:620a:25cf:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cd5af7a53fmr647679785a.49.1772704304922;
        Thu, 05 Mar 2026 01:51:44 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cd5af7a53fmr647675885a.49.1772704304504;
        Thu, 05 Mar 2026 01:51:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/6] gpiolib: unify gpio-hog code
Date: Thu, 05 Mar 2026 10:51:25 +0100
Message-Id: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5SqWkC/x3MTQqAIBBA4avIrBuoMYW6SrToZ9LZaChUIN09a
 fkt3iuQOQlnGFWBxJdkiaGiaxRsfgmOUfZqoJZsS9SjOyWijw6PO8Sdce3tYnQ3WDIaanUmPuT
 5j9P8vh9JWtyHYQAAAA==
X-Change-ID: 20260224-gpio-hog-fwnode-b46a53196253
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rQwmOJb4O8I8mlsbHO9IDxXCoYF1W2cwc11R5kOlHIw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIkgjKn8wsYQdnDa6vZ12Pc+Y6pTgCNa4C74
 pXtrDKcXs2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSJAAKCRAFnS7L/zaE
 wx1OEACIl6fRdGiMY6XiNPs+wPhYwJCCC7ygnK5SKbf4ZfA4QVw8jZtlPnuxDGPTKGWKzh2ce5u
 jKyxn6s5tTcytgFl+vlLG0t4ZEOgTOFdedlbN26Dlo02avU3BY7FmBTypt6FpiZyuu3dnpn711e
 WgS3NiiasnpGAl8MD5zfxqkij2t78hkzrRc+pXuOP48atyJwOYOKjDvFMU+ZJXWb15l+pmQfj+0
 XZaL/Jkarq2qOuFXiNuhsIsxm7jo03Ts7M8bBnKtcdKr9e0ksbQLT6ethIDmPkfvEVoffAwpewO
 zKl9v4bWIrVtI1cyo9Mq1CbRlff4myd/gVRMrJUm5r+sM+iXds8zKGEqp+8k+kftNcnwYJD7wIP
 1ADDJ9fbvXRo8pSjHTihqBpfSo8Uc7zodC09ywWi+sIWxWRjTUv4yYVVA9BS/GhzJAw+TXmDWMU
 7E+s7qApuBQvA0l8XrzKuU2L8Z8C9+voBZ8B3qhg9+d3qy8aWM7RHiaLJpifmImH6yXYTl6l9I+
 zb5YHUnjLJ/0Xg45FWfXIe7sghEiO7LIbbsbaF7jlFDe0VmtCcaJEwYE1VRU8RXTLZuMIpaYY8w
 rDNN20awgzHH+CM0JhjXqdSoOlq2PL2PMgghzfyE4eCOqVstL6oJEwCVwrnRMs8d2skyU8m/EZX
 1rXdW7DFDhYPaeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fNt1s3JhiCywVqFjQxYftVZ4Jz7WsSiC
X-Proofpoint-ORIG-GUID: fNt1s3JhiCywVqFjQxYftVZ4Jz7WsSiC
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a95231 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KhiCW88sooxdVpxl3PQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfXzKrsHlbfoYd5
 YKIXkIoVfnM0x0JDSFGwaDyi5jqg4Xq8C1nuyjzmPOqREk9Kz3DxmfqwSFFQYLvG2c0bku/K8lA
 bmNL64uoubDo86V5AJRzzW6wWX+okSrmGxyWWyXrt7zCm7nWXcpRtx/5//3fhyeFs5z2VxjCUj+
 xQnBJMcne3+dYgbH2In/oIkNjk+6zrtiW3hyp1ceyv/euMVpVzpY2xjQ65CHCHE0G0foDZWc6Nd
 AxSiGlAGFDz5OQEpsLhfLEIoJjdd+klzKu4EcM4gov1F7qsQl2h4cFqFFotEIOG+i1h+kLWTiR7
 TKHVuSozFRbDxncJMRVuASSrWPH3fGJXUV69SCFvWaVxZGkDebzgLkYk37eeSiEs+huYJ8PVdwc
 vttE6y/SfIqRLBExwAZ2mDI7PusDC8mWKFfcBqvNksnoFz4VUVIztLtn/dDELPA0Yqmgp25o3hq
 0LcjGznNIhFiIipuc/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015146_916424_A642D30E 
X-CRM114-Status: GOOD (  16.87  )
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

GPIO hogs are handled separately in three places: for OF, ACPI and
machine lookup. In addition hogs cannot be set up using software nodes.
A lot of that code is actually redundant and - except for some special
handling of OF nodes - can be unified in one place.

This series moves hogging into GPIO core and bases it on fwnode API
(with a single helper from OF to translate devicetree properties into
lookup flags), converts the two remaining users of machine hogs to using
software node approach and removes machine hog support entirely. In
addition, there's a patch extending the configurability of gpio-sim now
that it uses software nodes for hogs.

For merging: I think this should go through the GPIO tree with an Ack
from OMAP1 maintainers.

Even with the new feature for gpio-sim, this series still removes twice
the number of lines, it adds.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (6):
      gpio: of: clear OF_POPULATED on hog nodes in remove path
      gpio: move hogs into GPIO core
      gpio: sim: use fwnode-based GPIO hogs
      ARM: omap1: ams-delta: convert GPIO hogs to using firmware nodes
      gpio: remove machine hogs
      gpio: sim: allow to define the active-low setting of a simulated hog

 Documentation/driver-api/gpio/board.rst |  16 ---
 arch/arm/mach-omap1/board-ams-delta.c   |  32 ++++-
 drivers/gpio/gpio-sim.c                 | 200 +++++++++++++++-----------------
 drivers/gpio/gpiolib-acpi-core.c        |  70 -----------
 drivers/gpio/gpiolib-of.c               | 148 +++--------------------
 drivers/gpio/gpiolib-of.h               |   9 ++
 drivers/gpio/gpiolib.c                  | 139 +++++++++++++---------
 drivers/gpio/gpiolib.h                  |   3 +
 include/linux/gpio/machine.h            |  33 ------
 9 files changed, 233 insertions(+), 417 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260224-gpio-hog-fwnode-b46a53196253

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


