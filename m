Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F71C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BXNIjjE8d2VbhCtEzyZftORf3rk1HhEtHYt3oWL5j/8=; b=hsg5ST/4aIzBLKo9QXXaDFF5Cz
	m1sjBbxqBWtGQDnM4esdd/6y/G01M07i+UFl1mG8obltBS/doMnoS1pF48WtNlfSAPD2e9Wtq80sB
	SFfZelWeZrkcmgP94aWrRMyEdYzJ9jdWlbaN6rJ9RjXuBvz472DmQ1bzAOQ5y6NoxSq1oOw/qJtuf
	E65wC7DYobhseS6n6mH8Ry+Kg0ztRD2Lc2xFXICc2Odw9vd5ctUE4l+8pADSdocwViuBaNJvNx/2L
	PQLcPOLgngkNFAdIS/aQJIEpemGkJojhvAyqS82pB91rlu4Tqulvwc5jUa0C9CP9/4Sw2thhTDT6h
	UpRn+URQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHa9-00000002KcL-0SaA;
	Mon, 27 Jul 2026 09:25:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHa6-00000002Kc0-1h3n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:25:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R8gVJ42721593
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BXNIjjE8d2VbhCtEzyZftO
	Rf3rk1HhEtHYt3oWL5j/8=; b=TgS0JFL9/ZiSVLj1b2/j3GnUbaHIya4eBavJML
	4mL+XoVCYWEy5cKH3Jw1ESK0BQ1gE+IxUV2bFgd3TXk87n4DlkBgLGtOxZtKXNJD
	NWpSnbwrs0cFkbVGXQdBb+GPSaatK8rFSFE7soNU80GX6UBfsR4vtJRIb8BbX0Xi
	ztuyeFQfQvcPneG35kyvEaRtM2n6Ha5obHXE4C/EiS1AE5OSzVR9u73Oie9B/hFX
	9mALBZAgP8Mr2QSxqYnzBD1rndOpLrh9E7t6SwoVP6i/XtGjCUoNasxcDvafdcLu
	bcT4M1r+MUvIfSl0/1LxiVRBew4t8ToOhEMckcbIAJ2ZVdgg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajnb0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:25:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso24637981cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785144305; x=1785749105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BXNIjjE8d2VbhCtEzyZftORf3rk1HhEtHYt3oWL5j/8=;
        b=B98qFC2wYz01oyccdHSMXaRDCabwLDDW89l3HIRT8YbT04rmSL2Q/zAurY1hytSsj1
         miRPwIbC+phCQfIPmMua3B1OJ1X89yk/mIn6i4e8+5y9ZpvOCG2lG1dGSEiEQvHhNwjQ
         VZVq6cAIyAur3HuOrXW6VIrylOh2tfLipbPh9oHmH9XlyxwhjmBJHxabXsQUCsD4e/2C
         2mO7RoT53PibqsrPeTYnj96SO4E78o0VREfG7wGwoXRASEReZy65GiVshCAUlsLsvvuH
         c2UUnbfhAS74R3aFQfJy4uzuDLmZbp2SjjBpphVfnHlnSDk13Ws1omJcNuEfV7zmcOOj
         DRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144305; x=1785749105;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BXNIjjE8d2VbhCtEzyZftORf3rk1HhEtHYt3oWL5j/8=;
        b=VV/IuLGPu08Zc1H87omSIN640aecTv0eLV25uTcApMRr02dKO2pF98sVW2fP0xMf7u
         5gmCs7Jpv6ehb6+lxe4v3ne7P2EsKAh2xJEMUtZsf6jXXNKg4fdMJyJ5UCo2A/Kq64Pb
         3kH6ukQmxT+OZwYZjDrdtNYdb7u9+Pn526ZWUEDEhxRPlmqAa2FpUVSUlO4si8ZazHTQ
         0elNQYqiZiGlBMeHIR1W2ekOoRUvsMgtWWznMQCJnhvkRqi1qeTrIKQug2y3JEg+xN2j
         gk1ESccwgoYpMchO5u80ZfdO2Mv4W90sq27hIy30j6n5/RnOwOpqWLU5hkzWnLD1lHaZ
         Bztw==
X-Forwarded-Encrypted: i=1; AHgh+RrbIzha44yKZfNcrRyxUazq74qtYf+IGy6G5Wo0z4c6KK7lYpxhE2mLXc9mxiZaNaXmExj+QMO9QuNt17lGUKAn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7L/lCCzLPQCdfWYzaycXam10DwAYpU55hMscZHHp3fEaK9vJa
	Cv450GQMw5KlB2zsAVWt7G3HRqaIfbUF7hdFyaDYJkBnGriHe6SK9pr49Vmm27ZLSSq5byhcmD2
	8eu7+TcLPt/OiO68rrSWlChSeIqGd84+FzyNR+EoaV0QRvUkC8SqVdp+ep569HUQuexDyOt85q6
	SV6w==
X-Gm-Gg: AR+sD13t3BZ1TNrdGjtGPqxgN7qZ4pCYUYZvKM0seOZrpBF29E1OSiYhrZuERPWjx7B
	G9NSDWX6els25i77JX8D9otT+5B9EQwNHiF6ER9z26av476V6qtdBlhjiEKgXRhJlWewbFozk09
	/yhsh2L7dm3FXqsBtmrV7HkQ6cyehYjwBwLzD6/sf6Qnh6inz99fhh4P4UmaUf4eJK8Irq5Rtt9
	Z+d+UuG11rRPJq+NfAt6sJyRNLgkJ79kADimmz89aSKpEQylpPT5C0lAfrpmumuBaTvIxbSMspN
	/oAADCe03ohqDrqD4DWkZi4iG3kaIey6nELW3fruXuWFVnMCnEbhwSV5KlT2iKWXJw2T0rZxeps
	Qc0dxExuGs8KkKl2W
X-Received: by 2002:a05:622a:15c2:b0:51b:f340:d2be with SMTP id d75a77b69052e-529a86c8ff8mr79521411cf.53.1785144304581;
        Mon, 27 Jul 2026 02:25:04 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51b:f340:d2be with SMTP id d75a77b69052e-529a86c8ff8mr79521241cf.53.1785144304129;
        Mon, 27 Jul 2026 02:25:04 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c9691sm2357592a12.7.2026.07.27.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:25:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Drop redundant lists from various Samsung entries
Date: Mon, 27 Jul 2026 11:24:49 +0200
Message-ID: <20260727092451.43570-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7712; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KGGXByqAct727YELO9+LMLusE8CCPOyq0E5LFYrQetM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZyPjA9yT9eGEDRhvFAGE7uhiZW2bvNIcf6f8e
 O1XxR3eutaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamcj4wAKCRDBN2bmhouD
 10oAD/4yLRNM7s3tOckBrgt5Pg7P2Tib75a89Po47kqTT/2LhKNvjgqQmnVTaBt3YSWJWPFjXyg
 cfFS7znMfWRlnFGFinKAcKFQWneELRjFiyhQwUb/JaT6uupHrk2k6kM55TdZm3z/vnPGziCXE+G
 oDkzEt5+xINPzRWapw8XdYoxlMR/A1wpaj7aEq/ePnCcJwKDnVoW73cCSNWHbfdOH1CqHlxWXHv
 gKHbEzhflwbdX4JawPpHRGODGVR5+18fRiUKedwvv8MI9P13aqZ7c3iVCk52pJL8e/74FAuw2ES
 mPl+KZ2c0hetj3+mHKJ+68adE1wUhqPNp3EanfaKWZZVdqpmNQqU9wwePmIdnfh0KokxAwi4i1D
 +R71AavhU02UD0AY/B5DlB7pvvaYOcyCkTHFnLCIwqGmXp5dqX8UiR3eaLyrr7znGrPaRQFXrhU
 m+j6I/38QkfqpYIfG2/er40v3hCjopvZZ2yaZJ2QPTZZ98fQng8v0nSR+jJhle5YzGfZlw359Mp
 xnEjw1EO5M/sCCo0v+24EXbpbfR+9icuMS1Obn5SJBB1hRjqpEG2NWf+G1KN9UXSQKYevQ91Tom
 A9Ayaihfad617aK39Krc2dX8ICCQ6FrqTZEIb5OSxxPhSM89zy1jzdDha2gIx+FgTXeQBmGl+w2 06LYqfTlCR7wNgw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9SCwB2fLxrlP9lpqfThBqpDLypu6cHIw
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a6723f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=xq3W2uTSAAAA:8 a=KKAkSRfTAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=6J6j7_AOAAAA:8 a=sLuR29lIkFDoGf37nhcA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-GUID: 9SCwB2fLxrlP9lpqfThBqpDLypu6cHIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MiBTYWx0ZWRfXzI/0xuizgWGS
 uDxsG/dybda9RAJmqIuFsSqjpMIpV+C8Lu79zYOcPBtyj1eiKkCgK0S91MQ0lnd7XMjPtg5b8zH
 Ax4fevcbKfAR3uu6GI/79RRGV1WjAlw9PGxRMtNYjkaH2GEsmgpkH8n40QESAUP2HSkpL/rwOGD
 MGPGU+0bbmjcXJzIQnlyS3jn3+q7Ln1BSGNO4IlQDLgs9EPNZ0A+YaAu4id3D6kGQnXJoiqAot8
 Squ/gSwP34F2h/e8IKKznTyO0RYznP3U/ws0YogbugHV4yZX4S/GvE/ckClsLKTAO31+LFqL2DU
 3loBpnDXzuqBSCMYcGn1uZke+hJuOoJQKgWKrn/Zt5Tz6i+VIZYzQMl6HkxGyxo8SkG1PF2RSiV
 blsRvMNTjYgRpoali41UOIQPiUlpinPoIV0vWqcBf0pBqhZJ3UD/zPAEwIHzf5WUiAR5L3UPKOA
 2iU9Sd9l+npnKvVMH4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MiBTYWx0ZWRfXwKk1nc6z5P53
 FkVEUrzS+CS6wDSlGEHMrHMrAMB2Q9N1mrauBvUMxsR2O4LMQRkGFxmY4OmMV2EAzlARBjhMaBE
 LNCysUcrfrleuRPeYxW2S4mVmoZNyDA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_022506_458924_8EA54AC6 
X-CRM114-Status: GOOD (  14.86  )
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

Individual driver maintainer entries (not subsystem) do not need to
repeat the generic subsystem mailing lists in "L:", because
get_maintainers.pl will get them from the subsystem entry.  They only
need to mention additional lists specific to Samsung stuff, like
linux-samsung-soc@vger.kernel.org.

Drop generic lists from almost all of the Samsung entries where all the
files are already covered by the subsystem entry.

Cc: Jonathan Cameron <jic23@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Cc: linux-iio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org

I will take the patch through Samsung SoC tree.
---
 MAINTAINERS | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c8aadac544d..761cdf667471 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3591,14 +3591,12 @@ N:	s5pv210
 ARM/SAMSUNG S5P SERIES 2D GRAPHICS ACCELERATION (G2D) SUPPORT
 M:	Łukasz Stelmach <l.stelmach@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/platform/samsung/s5p-g2d/
 
 ARM/SAMSUNG S5P SERIES HDMI CEC SUBSYSTEM SUPPORT
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
-L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 F:	drivers/media/cec/platform/s5p/
@@ -3608,7 +3606,6 @@ M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
 M:	Jacek Anaszewski <jacek.anaszewski@gmail.com>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/samsung,s5pv210-jpeg.yaml
 F:	drivers/media/platform/samsung/s5p-jpeg/
@@ -3617,7 +3614,6 @@ ARM/SAMSUNG S5P SERIES Multi Format Codec (MFC) SUPPORT
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 M:	Andrzej Hajda <andrzej.hajda@intel.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
 F:	drivers/media/platform/samsung/s5p-mfc/
@@ -5696,7 +5692,6 @@ F:	drivers/media/pci/bt8xx/bttv*
 
 BUS FREQUENCY DRIVER FOR SAMSUNG EXYNOS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
@@ -16125,7 +16120,6 @@ F:	drivers/power/supply/max77976_charger.c
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-L:	linux-pm@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
@@ -20859,7 +20853,6 @@ F:	drivers/pci/controller/dwc/*rcar*
 
 PCI DRIVER FOR SAMSUNG EXYNOS
 M:	Jingoo Han <jingoohan1@gmail.com>
-L:	linux-pci@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -24152,7 +24145,6 @@ F:	arch/arm64/boot/dts/exynos/exynos8855*
 
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -24162,7 +24154,6 @@ F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -24192,7 +24183,6 @@ F:	drivers/platform/x86/samsung-galaxybook.c
 SAMSUNG INTERCONNECT DRIVERS
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Artur Świgoń <a.swigon@samsung.com>
-L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	drivers/interconnect/samsung/
@@ -24205,7 +24195,6 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	André Draszik <andre.draszik@linaro.org>
-L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
@@ -24224,7 +24213,6 @@ F:	include/linux/mfd/samsung/
 
 SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
 M:	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
-L:	linux-media@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/media/platform/samsung/s3c-camif/
@@ -24239,14 +24227,12 @@ F:	drivers/nfc/s3fwrn5
 SAMSUNG S5C73M3 CAMERA DRIVER
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Andrzej Hajda <andrzej.hajda@intel.com>
-L:	linux-media@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/media/samsung,s5c73m3.yaml
 F:	drivers/media/i2c/s5c73m3/*
 
 SAMSUNG S5K3M5 CAMERA DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
-L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
@@ -24255,13 +24241,11 @@ F:	drivers/media/i2c/s5k3m5.c
 SAMSUNG S5K5BAF CAMERA DRIVER
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Andrzej Hajda <andrzej.hajda@intel.com>
-L:	linux-media@vger.kernel.org
 S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
 SAMSUNG S5KJN1 CAMERA DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
-L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
@@ -24270,7 +24254,6 @@ F:	drivers/media/i2c/s5kjn1.c
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>
-L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
@@ -24279,7 +24262,6 @@ F:	drivers/crypto/s5p-sss.c
 
 SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
-L:	linux-media@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
@@ -24309,7 +24291,6 @@ F:	include/linux/clk/samsung.h
 SAMSUNG SPI DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
 R:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-spi@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spi/samsung,spi*.yaml
@@ -24325,7 +24306,6 @@ F:	drivers/net/ethernet/samsung/sxgbe/
 SAMSUNG THERMAL DRIVER
 M:	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -27924,7 +27904,6 @@ F:	drivers/ufs/host/*dwc*
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER EXYNOS HOOKS
 M:	Alim Akhtar <alim.akhtar@samsung.com>
 R:	Peter Griffin <peter.griffin@linaro.org>
-L:	linux-scsi@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-exynos*
-- 
2.53.0


