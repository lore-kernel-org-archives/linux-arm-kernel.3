Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0181ECD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=; b=UCTakGw5oVIoJdfzAko7dZMB6g
	axjBMY5hmOfc+amyJW2zmLdvDNyELoS1AfM0nZXGfeSMp+LjJ1Az0lm8QVNe8blj9K8KOVGOZqWGp
	hcmcQnHNBImYz15YWd2v86FZTt8wC72zG/9JSMQdeV/wjfTogjbb4ppe0mgeHRgMfGea96nJF7zBH
	en/iqDknYz+s6AX5WZffLJShAs/85OJqd8ek6xC3TioYk3aBW5haJ+T8b6BFIZKQzJ91AW7r6xLq2
	wJGYDk1l89SzXR2LEceIpGgVVcL30gOkU/TBFp7Jh+5zMtCD533zNp/vNcbiqNAbmULQ8PRYudaJq
	HB2QZPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBR-000000053xU-2vTW;
	Wed, 20 May 2026 15:50:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjBP-000000053vo-1IYB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:50:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2KsP826519
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c
	0ys0ZYB8=; b=Ua8Izd1gpLKgn5yT3Bp1v8iYrgBNZF+Z/qME/JHhtgBVbD+a+2F
	rCwJOd0poMpHQmal8bncpFwVtH4+hDda0zZLK0maAxgUsAWHdSLeUzhk50GDnCtt
	ewSG5JopZ51NrLEsx5H9WjoWvBtAGsJQUziNXC8qqubMbrc/KRkn71w1Qqc+PdTY
	pIQ+rMHDvoNCIJz6/sps2NffdAvdLLfJ9aY6dLfj1dhklpROIRwn+RyrhI3sM96m
	bUkBbeocfBNuut/ynYWOIbMKkEHDaIHUXQRVMdVCVL5X/0JBDfyipvv7qiwivZHP
	K/cyG34mKBe9TmAddjouR4le22ueWVeDVZg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecagf43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:50:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6374098885eso8987205137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292206; x=1779897006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=;
        b=jpls7Q4GdallNtl7PY7m/aXGFiacCaxh/notQ9dNMKm4Hibk4ahSBKjZRBWf1KNDgT
         /9gojcd+FTYvXoYyQV8FgqggvlVl3N/N7MUAa2kTEH1+U0v1nvbb9FHFDDRBdaKAOL4A
         /M3ivsrUVnX3bujhMGehiPa9VMGf9JRVcfjh+4wTCJzvkAkf/2RY/vXi7PdnfR9Z7JK+
         3TH8cLfxfJdTCWiBwQPDSOriDSBzlMDCpGoP6yeEqwVPKwYwNNUeP7Rv8gy7Rj1n63RU
         yIZWBMt+JOMbSekfextB6uSX4FiOa4UC8tybPzoqlJ8d9+mmuTNNixyvXmU3JMo5SN5X
         t2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292206; x=1779897006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVrinP2WXVN0UPklivX7qznF55gUN24Ip8c0ys0ZYB8=;
        b=sDVUO0DiWh6kcaoBL300N4eqbuHebej9fMtlkdds+wWjAKzj7494RMy5qFka4IwZDV
         3tSVbdpHkDmBJjAVZjEcBUrzPktYmbsuYG4ATTQUqFhCIB7EOtZKUYODNSDD+x4dWwWg
         IlZUuEErnG9ep8I6fFscZPPW1T+qXMq2uUKyoG6+uc9+ZFIeKY9T10avrFr1SrvoB8xW
         1LT+mFYUih1QI+v2tA6sxGo+laEULMoKhI7H/l8O9HF0Scns12C2NVGUg0K3hlYsDEXv
         ji81xk8Zlb4uoz5Y2GMpGSOjPph+OseEhECkYbJRlClnz8Xm8AC6kben98vmq511n7XQ
         Xncw==
X-Forwarded-Encrypted: i=1; AFNElJ8btQ+ldwvSMCiP3olwGZO13yzvpuDnRenNs/r5luVIJq0HzmuDBJ7CeLg2jIZwtVyOEdHzOhLz7sfVVwzsfx9u@lists.infradead.org
X-Gm-Message-State: AOJu0YzhUYfZuZRAr4cdJpIJNxgAWyHTtrTnlCXC/ZvZgLlYfOSNMT25
	WL433nCT84t/SwIOajiiwcozD0JQioZGkSpn5DbaZoeCCbvh8BjWh+I0p8YISD0ffvLHV0E0ZGP
	gxt+G9TCG/SXYWb1GWG6340wcN1e8opKAZ9GKaeLumHbbN4ukL5lyUl/nSyZpoYoCG9WIKrjGqz
	iljA==
X-Gm-Gg: Acq92OF0KkcomYt1eeYDVjkvY+CySLg6P7is7XACicW14kVr2GYCE45oTuzlIFS99WA
	fCerCYZcNU4Oi41Zf/3jkWicHA52LgWANARl74m+OoRE70WSYMos6z2//NDFr/0SOH77917igpQ
	VPbBpMYbX5VYAwo+lQhcxbC/PF79POFujzuSYtsbY8VQ+kN5KXwp8vl9zKHgNv1D43lBggeAoz8
	sQB8y/8vCBSkBbDw9T9Y4FeyT9HJculRrgQfCJck5pE38cag1t4nHUMR2NqV46YZrSs1xBedQdf
	p6Ms0cS4X4EHl3UQMI6ttvNwSqeH3ohH8hFVr6teLRRnnvCNNHSqiSB+WzQU1J+Yc4NOQ1KebCZ
	2b27ulx7wQMPk0jNoaIiFpMWj4aG09w2dFuCMfWe5mV9bJ6ceiFZgcvA=
X-Received: by 2002:a05:6102:41ab:b0:62f:5908:648a with SMTP id ada2fe7eead31-63a3fc9c913mr13617429137.28.1779292205719;
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:62f:5908:648a with SMTP id ada2fe7eead31-63a3fc9c913mr13617409137.28.1779292205212;
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] ASoC: codecs: max98090: switch to standard set_jack callback
Date: Wed, 20 May 2026 15:50:00 +0000
Message-ID: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lSjBWQog-bGIEidsEzklv7k7cAWvBGFw
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dd82e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=PN1NiZu9CLyR3tTXQRMA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX29Otk25Uil8B
 zqapbsLv8SMMngBv8v/js8pBppcng1ski3LQ0N09wZEHebMswlF6sjsuj84TXsrqNAW9PkiU9ht
 P2R5rulNPV5AJxyGrM4a82zqj2wQC17bGxqTpl4ynlJBrKJiJ8fWCHFGUuo9FWNU6V7JYHAXpoz
 LJY77T5ae+OiRYhvO891Ym9kINSaLzgdQchtJNHz5Ay+SG0GE7iIYdQNTddoXsQE5ssmtGjmobl
 hc2wYTZiyHCVrceJoRDtsTalovmEqZcJmNZFKXpWoQi4sr86WqjOLg6F5syqkiXzTKCGNCK2E/w
 PnYvu4oDRDrXa3BI2TKQWW0cvOXMFw/M7WlnVy9K2Ms195o/eJ6N265z+mDOb2pBPzbdPFZFgaU
 /kNAqbxzKCV3mtIzdfT87I2otdUJ7jh99uyiQUTgKBcU6xY4GmNV9xNh7bsuI4AvodSL47q7QnC
 qO5fUxiBRYwZqxpYwuA==
X-Proofpoint-ORIG-GUID: lSjBWQog-bGIEidsEzklv7k7cAWvBGFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085007_353554_C82F6B3B 
X-CRM114-Status: GOOD (  14.46  )
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

The MAX98090 codec driver currently exposes a custom
max98090_mic_detect() helper for machine drivers to register a headset
jack.

This series converts the driver to use the standard component
.set_jack callback and updates the mt8173-max98090 machine driver to use
snd_soc_component_set_jack() instead of the codec-specific helper.

Using the standard callback removes the need for a custom exported
symbol and allows machine drivers to use the common ASoC jack
registration interface. This also improves compatibility with machine
drivers, such as Qualcomm platforms, that already rely on
snd_soc_component_set_jack().


Changes since v1:
	- reordered patches for build failure fixes.
	- fixed typo on mt8173 patch.

Srinivas Kandagatla (2):
  ASoC: mt8173-max98090: use standard callback to set jack
  ASoC: codecs: max98090: use component set_jack callback

 sound/soc/codecs/max98090.c                 | 10 +++++-----
 sound/soc/codecs/max98090.h                 |  3 ---
 sound/soc/mediatek/mt8173/mt8173-max98090.c |  4 ++--
 3 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.47.3


