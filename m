Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A54EEF33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O1e/WtirdtbqhjjpDNbqAtXh4FvgzuNdXObhodxahv0=; b=bMEsDiq+pOitqu
	eIgv/fP21Ch1aQL4DaR+pwJJi5V5IVfee+J3e+T5cJStPiWBttLyg/KG6cmsx9ehfkk5/hlPTpimH
	yU7AW27Eiw+UQe05RVR0bVpVyX5fP6kX6EL338ROkH1gjGX+tX8S9Zac1F1YztqRtAm12+Y+Vr5qa
	VrbaoNZeRizPd22AmbFy1AZrpMYeTht1lp3yIja4/7Mx/z1lYqY73I2qR0WUE9+OUffSo0e8lkiKt
	iDWAYIMcM/rMChea7qi3bGH+cugZ9M7RrYLzuBpqOzp857yD6QMpq8chxBk3qzG93tfKNj7J4fplI
	4878PgCj13s4gdqy9hAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4i8-00000001JkR-1QYH;
	Thu, 05 Mar 2026 09:09:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4i6-00000001Jjf-0cMS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:09:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62590gQH1193313
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O1e/WtirdtbqhjjpDNbqAt
	Xh4FvgzuNdXObhodxahv0=; b=K/6Q9TNyNKLtjRnNnmPU1JR3k2UXIabC7yeq6l
	ERneT2k6JM5E60jWaK7rIzZduj2H/mFRzAY4sepAFHuLjJxN4Hil7chxOUEC1qPj
	KrlN5/HOZGvyYEBGusyKyw1/pBhrDNbLmKis782Qr7Df+myEjYkeQm8fagleWzhz
	NojHbJGyLJyJn9+xKoOyojw4g/yaT6L3jDYQhwiRp2ne+eKUYx2cuvlxHm56VLS9
	at2SsdfVRlwnF/aSap2fWDSdZL7u17d1AsMIlFA5seQkVFNtWmTIku9t/wrrAkl+
	RGMzaAzSmOxFDKgKrupLQ/Ll3N8cIOmXvR59GwA4518ZoObQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgauue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:09:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899edf01747so357002376d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701772; x=1773306572; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1e/WtirdtbqhjjpDNbqAtXh4FvgzuNdXObhodxahv0=;
        b=CPmgmXjs1njHjL86KsYvr7PA9WOZsMsJ3ROIhR8AjSn06RNLLlhu5XrCopBcvS4F0R
         6vtJNOWC27fRr57McYxmf6MvrzYM3zhJWWiwxFJfW68MVVGagZaEZLFRj6aWzToPtL8X
         9sCfSM6tqz3yFEXHkB3A1JqAG75pckXfwUxTLSmaQ9OVhp/jDQ+rPMfG2mIfKtvR33+L
         UbagBVBFdowM28OqWXOmvRYoz5NeR0uKFaRzBkxwVauycVJUps5fsjHOjKYTftboxrv9
         QVH4muuEZJU7xnCkGtaJco0DnZnZr6lb6/mgKZLRRn1e9P7oJYrid6j6kMR9PHd/FWVM
         m5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701772; x=1773306572;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1e/WtirdtbqhjjpDNbqAtXh4FvgzuNdXObhodxahv0=;
        b=pAsWmt5B+l7G6YpdHE6osocNKIqWbAhne/PAQjAq7J86WkrVvVm0OAEpu90A/Sr5DI
         E3ZF7wvYqDGHpM3wwZNiCzaXLbj2d8sTPEXjFW83U0UQ2817cudtRdOIe0d8fIB6umSC
         hDuJwCt9T+SlLqPvl9iiEGs5A57dH/myrllB5mvRMWX+9clIjGzyRpbkGmz7+ddXVENJ
         ancebdH1PYbsZoHDhmMADU0IQWZtq2K26csEH5jl8wepw+7+NZMYcVjeugGrV/Y0lUQx
         GsSsZil27A6f3hUL3kcXoeU1HiUb1WrYu3QclIA4BWXfQO6eo21rO51QIEMHgmcpu6xG
         L3sw==
X-Forwarded-Encrypted: i=1; AJvYcCUj0TkhPEGb27PfmMgjkHpQ8yct1DFXxlYXXrk6/VAwifSco3G418wEMrkLiWO6zoY0knXhcqMnYVH8kyR8V1uI@lists.infradead.org
X-Gm-Message-State: AOJu0YyL/vUcaVWVWG+Q8yneOqnKWGrzI+tP7/xvXkDnpAAAmVOzeX7V
	MUqfJf6Qw0cK9XhBAHVxx3C8FnJWlWTX1rw/sBBB9YL1TTp+XVY9SLB5u9/Gf5CiyUlY1/DlOiE
	LO+7/aGq55rKyeZdw3o1JXB0pameswMTfrENGHjLGFDMUuPrb1kolpUEDzVR39hpVzw2QiizpAd
	6Gurw7PcVcMg==
X-Gm-Gg: ATEYQzxQ+MucEoqBGns6zs4BStMWR/UFMgEJXk9D5TNEynOkScip1s1KEAWfSn21GR4
	FyZqsf1szxB7Z89wF/ZMeAsBC1vb/q+yszfCE/kZrfQ+COJzADAZX+nd7u1WOoViXzz/2o7eyCg
	VfaALFoCe4VOjZjlxdV0JcpbhIQIpt8XEhQZwG+368+KGouHxhKcOwf5zkljVEOpILp8sNq7v4B
	CD3ajdLrCP+cQHoSIi2EcyG6B3cxG2WnhjXgq0yfs2CG4xXw56tl/ZF9NC4Tk0uz/v4QhuLW/MF
	yHeioalW+HGoJZfb8OL8zzJZKKTsaCytZXBmjCxeFx22bxnwSjmScPm8aPmGR+ZcNzuROPqN4YQ
	25TePRoNQeNfdQAbVHtCHj+mTQAqtSVDvTmASZHgc0Rl1
X-Received: by 2002:a05:620a:40cf:b0:8ca:33d7:8be2 with SMTP id af79cd13be357-8cd5af96737mr662780385a.54.1772701772106;
        Thu, 05 Mar 2026 01:09:32 -0800 (PST)
X-Received: by 2002:a05:620a:40cf:b0:8ca:33d7:8be2 with SMTP id af79cd13be357-8cd5af96737mr662778485a.54.1772701771688;
        Thu, 05 Mar 2026 01:09:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] ARM: dts: exynos: Cleanup I2C address-cells and
 size-cells
Date: Thu, 05 Mar 2026 10:09:23 +0100
Message-Id: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENIqWkC/x3MQQ5AMBBA0avIrE0yShFXEQtpB7Mp6YhUxN01l
 m/x/wPKUVhhKB6IfInKHjKqsgC3zWFlFJ8NhkxLNVn0pyKnO+yKYhxSt/jeOGupIcjREXmR9A/
 H6X0/o2yhvGAAAAA=
X-Change-ID: 20260305-dts-exynos-i2c-07fd82c55040
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ai5g8g0+adsS6IS2Vp/pH5BD4m97fOakeCHE7AL2bMI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhF3OzzzFwF6cCEKB9NbNfqNWY9/5JFjTYUA
 61Y2ySXPJmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalIRQAKCRDBN2bmhouD
 1xJ3D/0Z3alg3ADG4aiPfhsMrJrOgxsGDZ63CltQik+60C23WOkmypdnYBEAPq2zshzqa1BNUiY
 fdUK/DDhBpKSwUkzYOynhjaKw1o33quRSs8i8S07gOeYopQZA8aoffHzxQ/urA60KuE8EdjKdUv
 zS7aKXVpGRm8GmcBeHf2mNBElHTd2CeDQLJ7HUnVpvS2MCKOf9MmoXd/XdmfCGZkb8S91KPq5fi
 co0jkF/YeTFKWkoM0eH6jShFZ9vMBIWuxgmm8+UhgqCoCorFYbD9+E43laUhgnJiAhBCDmRzxcv
 3oXdA2nYZKdYzYFA7Ao0nmmqjAgJr3uRtXRSs+HroRtuR8fW66zsIl5DMwIfH+jFTomNV5V0Mby
 741mEeQhiel2731qL3VN7Zd/kCIoKWbHBrH/wV6LUY1F53Jktp62NcKRnP9/hM//FF8w2vG5y/d
 fy1+G2QmCKcl8QUpKpCSqSWhuFb/11CoNUiUNp8VoooAHPnGbaVel3OmCVMzvScJ7lug8envMHQ
 0QgIvBXyojkCRDElRcgU2QVV2Ood9sCfVdb+PBX2MbiQYAHvwTYh6pJbMMSuA4oqLRAATPJRScJ
 i7BdO/26B4FPjehgvGqIZWS520FTnD0BvqDVRm3OFA5cmybjntqmh0fsQPp2aqHudjKWXdyZEt9
 ISMBbi6w0cf+Ulw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a9484d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_sLVMVooNu3QwFCXD4AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Lk9urkAf5yjIs97WvNqo2P-OED-jZsKn
X-Proofpoint-ORIG-GUID: Lk9urkAf5yjIs97WvNqo2P-OED-jZsKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MiBTYWx0ZWRfX0meDPnhwyWq3
 y4G8eeRg9XW3n+chBNrRA6HFuZlWRTtmJvTi5ZJmEQuzHhLH+MPJz01kj6NxOBs+zqRoBIKj1Mq
 q7BglfWqhEohNnjnfpM0o7LchSVWSdBLZfn4pX8XMvHwoAyXxFAYp3OqK19WdXdcRl6LcZHjIch
 F+zq/2Trd1rTS8hCBSHtSxqAu7rhzA5T+iaB4QMwt8zDwabBVAudl78/eGHj5ddsKsFwPwzo812
 yoQm2O2OkjF9/Gv09rydzObXoaapUquvS/GPmrrmMfdHp60DfHDzAejc0Blknp2MRXedl0z3UPo
 0nZS82l9hJfWiGvqGjsVChUV9ov6IRVgeeffoTxkz3bsc9926khG8mOuMz+zXbTRE9rZGRmo3Xp
 BPFHF7q9SzY+QEVpOS+8x61nSa4NuRWcYfp6BqiZ7/6tKLmCuDfjNz/TCK18FIyYo3iq9DYqLOJ
 Dm5DOXSRrWCpqqX8faw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010934_309769_2398DDA5 
X-CRM114-Status: GOOD (  11.42  )
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

No functional impact expected.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: exynos7870: Move I2C address/size-cells to DTSI
      arm64: dts: exynos8895: Move I2C address/size-cells to DTSI
      ARM: dts: exynos3250: Drop duplicated I2C address/size-cells
      ARM: dts: exynos4210-smdkv310: Drop duplicated I2C address/size-cells
      ARM: dts: exyons4412: Drop duplicated I2C address/size-cells

 arch/arm/boot/dts/samsung/exynos3250-artik5.dtsi   |   2 -
 arch/arm/boot/dts/samsung/exynos3250-monk.dts      |   4 -
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts    |   4 -
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts  |   2 -
 .../boot/dts/samsung/exynos4412-itop-scp-core.dtsi |   2 -
 arch/arm/boot/dts/samsung/exynos4412-origen.dts    |   2 -
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |   9 --
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |   5 -
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   6 -
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |   3 -
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |   9 --
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  48 ++++++++
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   2 -
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 128 +++++++++++++++++++++
 14 files changed, 176 insertions(+), 50 deletions(-)
---
base-commit: 5665c3a48685646320635b46081350191cc67e18
change-id: 20260305-dts-exynos-i2c-07fd82c55040

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


