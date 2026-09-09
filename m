Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16236C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=apcsZg0PcToMRQMErCaGrjGBMFk6lJ70wquYVwMAbm0=; b=mUiVvFzc/g6+BE
	+6+HEDlc3utT9wRS0jcfZZOehjA56/lTRZUKEx1B10eg5jj5gPsva5vAV3wDS0hqlZ3Q+gwBY8PHl
	FgnKsJ0Cs03a+P5GcGf87Yr7bXQlw1SSPZFt+6TdiaGaSR9aR8rOaNy9WAqg09EBuZTgV3Xf1A7zc
	1BAb8ttvUCIHPPCUiWeMtwvfiJHs7s6mTC6Ac+F0yoDpOweQ5b/C9n52ukJoOS0evo3gbDYt4NMbX
	A8S5s6RAoXdhkWKshuKmxreyDbrbIEvR4hq5abYtwpB68jNorFGXeiAzkieLdS4Q3a5jT0zVp0pq7
	H81YZnKkVl+GkT/FtIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7n-0000000BwIs-08gH;
	Wed, 09 Sep 2026 14:18:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7j-0000000BwI6-2jij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:18:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUGNN2376139
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=apcsZg0PcToMRQMErCaGrj
	GBMFk6lJ70wquYVwMAbm0=; b=f3Sd0IcWNDGqqEPl6fZ9kvm82NXdz9l5KzeK68
	X0itKvUapiJNGTCiC+zbEETX2wV4WFElBFSr3ldTTaqH9PPWws7xwah1P/vvUg8Q
	G6DMtgZNlYyjVs72p5FC/40HczSWpwJWjE2NmXvbGk7v6mywa217u+ZGwA0O97oE
	JTbkF7FKMGmckwDJE/0cgzwTkz5U8FfMjHKI/UK8Go65jD9hJfDKFdNzyDhu00/G
	XgZVeEYMPogNolKG+npNCp0zwnfrU8ye+70X10CXEdi71kcb14xTQiETSMVISaPy
	n8ueZsgMGPL0vH+67RL+tmDq/+/3MuHuiIzUDM/UsPudkPRA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0w64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:18:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so5047795241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963481; x=1789568281; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=apcsZg0PcToMRQMErCaGrjGBMFk6lJ70wquYVwMAbm0=;
        b=AX0QYEfbWD3tcx92H71jDl8nnMoilKM8c+KXcjjiG5udja/nFl1Y0NXQ2vPAfdjhrR
         oYceXdOM735Cukfn1Q1Jy+MxjyNobyWISjvv91Yd0MjnoL2xcDM01UbQyaL5s4wfaqqD
         eKM70EQBEbzcHfLe6e8NAyxmBxBZZ3o1fxjetK7oytTmWwfhR383txomXzp+5MAY+Vdb
         MkkrjGPUUPEH1yvN+3NGr32IyA0vUt3M6JFbvNpjOZqZxlhzl51nNqxjr4/7a5Humvbq
         u9rkwA+/UDP5DPST9+74LoCNnjrhc0UoEfUntUPbDofvHZPI22FuZ24j1V7TjJ9wjfNM
         wkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963481; x=1789568281;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=apcsZg0PcToMRQMErCaGrjGBMFk6lJ70wquYVwMAbm0=;
        b=s00H7i1CA//p6xdPkF3ckZ2Vja82ZllUzEC1p5lS8v4snJi0EAdcaEeCB4XCoZ9xDF
         yzV8tjXNa9LtgV+ZvBtO8XFJkNSZgMyx1hLacD0Da7NjsPtg4q0iMbEBUGqp8tSt9gEu
         qbGjbUdhHgj1RupZucjF7DoDqwxCUbHyIzamB7dApw12e7sccbGbRe+gdCSORXI1jJ9j
         9zxTjbLVAeek2OLJMGDAZhoQM/P1T+VmGuxzA2YQOYwOb8HQonqgqcscO4UICQ/HyteP
         GgBexNkxHnSjl+8XWRqMp6eQHi49tA87jxJJ5wJ1ffKpews+eGjjBxx1CEROD5muhd2J
         YTBg==
X-Gm-Message-State: AFuF++lI5pLF1m89Ugkq3C6smKOEm93MZuqDmqBtr52C5VNKje32mIS8
	LOwaTe86ECzaHJ3wPswP+9f3gJ+yglFr1CHG76J+zUcYLLj5cpWmSTQB/2r/Hu3Hyd96RQNVSJV
	0GiszscX6lMyNSAqQm0m/u1/e6gDmAEwHrG0Rj/2BmiobwSWiVCIBNiCsXgdmnkISP8IgiEVTEb
	mBuRiCx97+yw==
X-Gm-Gg: AYBFou1XaK3IAkkDZuhncUMJsjSIgKYALP5RfCTs9v8NIuZ8/8s0f4XPLuNvbXoskXD
	85tgsrVMnTcgZvD6HGptABCY4XzFBfE18oIT377m1SYyLXclS71JUSrc3kMvkqRgdmk+DMS0G2n
	mB+vn7jNgYspS5ObS0Lr2EWzDZLnHotfpva7nXTxUwJo/fkIunhLbVDQk0Kyn1YUVeKR+sMiJSM
	vQASNiLuvDl0fTHhDYxp+C/0/LjFx/xp161znxuRcK9JozvYOahhEdJCg8SaO8ZkPLY6IpntG4V
	c9WthjUcfhxN2f9wCjLpYDynIssagAohXWojNRRVW9a04lEd1Yxr5JnknPOhZ9fDEnrcUOjjvfW
	do7v8j0RHIBCLEpyZccXWEuU=
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id ada2fe7eead31-78a568a7517mr6302030137.5.1788963481442;
        Wed, 09 Sep 2026 07:18:01 -0700 (PDT)
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id ada2fe7eead31-78a568a7517mr6302023137.5.1788963481058;
        Wed, 09 Sep 2026 07:18:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:17:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: fsd: Cleanups with new dt-style-check
Date: Wed, 09 Sep 2026 16:17:51 +0200
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORuoHczNXxEPXRJnhtbRtEMY+
 3erHt/lbWCSVAzOzQZJVjV9xYrjoQG6hzgJKleDd75zgxuQs6GFp5U4IT0kxLKg5aSUsfUnYmL
 ueglQgyXJTd+//HL928o4C+XvCPv+AbRhanh+AAAA
X-Change-ID: 20260909-dts-samsung-cleanup-strict-327cdcdd68ea
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c0cxm8DOEPLClpli1HmvHjC8bu9sqa+m4ayGpk0H/b0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqRFO4McZz6cukP6b+AMueoMq8DlRFKGo9mR
 6iA1gvgMfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkQAKCRDBN2bmhouD
 10WPD/0f7lIhTibcfCES5gvYPnDu3o3Lu2IW7Qj0PrIYjFjbilCdgC2nnk6SawIlqdW8B3uZTQd
 or1k4v6ReZma6X4auTwcYAu2UnN8Pz+qQ9UhOmCsvKFhXz4JsZmrm52PhlKhjmd1T/RbkHfmr4N
 byaoSJ00WrrwMFfIFBVngsoIsjdtPeK+jAXOcU2rY95Pl7tN3ieYeY1ZhuF38CJ3ed/CtGz3V1O
 U5oW3kbA6PPpLWMdx8BXo4B/ygsoa4HT7OdECpM1NSWRRO7BYcNFxuUhka6NqVz/BSCdJsEk0Hd
 Qy69mjaWuWy0xmqm0fGSutPV7f6vGoR6GBZHVHmLPCVoTrP76AWxVFIn9DzixNyxKiFh4knJZz5
 jMNI46DgssgiO+GH30qi37RClWfjvkPYPs8aNs86T8Tsx0Waz2O0B4m+lVJZdgmR3XvC6b7JO60
 ooza896KnZy9l3UmPw7Xnq3jozGmd+DXiqr3BwBdTAdcjrPXdxMlTtDiPplevdW/qmAtRtU5F90
 egTcYZiEIttSbJjBtciF+3zV9oZxR38kwyB/eyGwMrIlXPMT7044r3HQHjAUF7kLz2D0ghXTEL1
 8+029XgQnNIgLmvf6tMZ2diccS8pqoFOOAZ9znsfa4OVpL9DN5iWZIx41N1n0KSQRj29rFE4lw2
 2WG0kEafeOl+ncg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa16a9a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=13zs_1EsgYwksEZ6_G0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: KQU5vTfmVIRK2rdu_3R3CD_MtZHV-HAE
X-Proofpoint-ORIG-GUID: KQU5vTfmVIRK2rdu_3R3CD_MtZHV-HAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXzx2myqOzfque
 affYj5v4mFoxPypD/gjZNmhNIR4rQnWjl7A2czF6RM6tf5D2KI0qisOCPb6a4yJ7AcxJp8+HE3y
 ddWdiOsxIkQfd6k2r4j4QwxvILXc1jo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX5W7Gz70tuBgz
 twEgiKZ54x/xo39BdSFpdvnT5hPxnonRNa+51KW9OudIdW+0DljuL5a7lbRN8H1Pzr6Bp9k3//C
 v9KjluX5a3YfH8w2RaTR90+mpoyfKDIKkXBcPw6jH5GSjyo//y12RQ4x/YXtwT0bG6MTr9k56WS
 3+d6dcFFXdQsCLepDfCG+tohUS0eateNTM7YQzzJ9U4JXFzjq3YvjUosXaWcMsACXHZzvu2qZZI
 EUQNxkUgpXB6/7lsohbj85JOYwoWVRVyCoEvbJCCK017gszZe/1ckcj8UtH8glLfxnedpy4vaEq
 J0dYuU3txnwx8scS9N10Xz/KOPqRqHJdVi8kSfVo1y1qN/HSRh3WiDBMY6Io99eK22xKJBkFxY7
 yXOEALEkFDlzklKXjq1cD/AaDxaat61FpKs8OZuAj+rUis0Yb2nr5nChjT+ld0ASV3XHPxUPgs6
 3C2/imRwPUW2dbGv6Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_071804_447146_60B37073 
X-CRM114-Status: GOOD (  10.93  )
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

Only a few warnings are left

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: fsd: Fix indentation of CPU nodes
      arm64: dts: fsd: evb: Correct node order
      arm64: dts: fsd: Move idle states out of CPUs node
      arm64: dts: fsd: Re-order nodes to match coding style
      arm64: dts: fsd: Re-order properties to match coding style

 arch/arm64/boot/dts/tesla/fsd-evb.dts      |   10 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi |   16 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi         | 1162 ++++++++++++++--------------
 3 files changed, 594 insertions(+), 594 deletions(-)
---
base-commit: 664f1ec11b4dc75f6de70a52e8219f812b6e57b3
change-id: 20260909-dts-samsung-cleanup-strict-327cdcdd68ea

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


