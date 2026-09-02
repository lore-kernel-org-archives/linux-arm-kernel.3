Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D769C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=; b=eXzn6KMBLB4wpkJIJ+pflZ71lX
	VLN5GTciQ7VXxDrz8ZyMCLXqcMuYYAtsWdrlctrhCAAFAWh1zYiGGqM519Oj3MO1dEbz75T5wvQ/X
	CKlmuwfqk8Ri5trBC8digK/9LwY3F/vGjYrn9HibY6zCWSx8M2EuNVQI76M9x7m+pmvXmo/W5jMj4
	UaSU7fd74CZmoScgerfNfmyfEfRdLDiRGlyNiSUPcTZqRh9ta97tFcJvRcNi4g6nwZv7kt3fVNaGB
	U9/5eC0nK2UD88OC9ilWPaRNEmR/XphusTXxYhY+I10kSVhpUYRdiu+Xsi94MazItA16TGEYdztez
	RvYZNy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvj-0000000FlgD-2xFm;
	Wed, 02 Sep 2026 19:47:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvg-0000000Flew-10hY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrlPj2731033
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aE
	nLgC5tuY=; b=fYKBCmKETr7hjhhElQ5bba4aeQ4CySO3kn9whRMrLELxcvgS3wZ
	TSiAe9qgWuenbUOZkYGD77ESL8ouruX/1nHHAu5DLzTSHzQ4itIpkTs3q3U/fyr1
	h1us0XQXNXIiaGy+VGJ+Kqbx+mdqi7kMHTg961EXjuRG7IS3cAjaIUmeDKXeaDOc
	0OFEXE0RinY4vkixwT/0CaNFS1uRG9U5Fr4jD0TJ98Wd2tWlY42E3VlcvWvxOrHw
	QktAgLkFUIjSVQaTNb02/6rTGonvIIAIA6vfcV+NPGFerUAITiYGt2xCeDUS3GRX
	zFQolpjTwPXCZ4x1RdoHfi3XCDrMQMiNzVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2pu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:47:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so2679597a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378446; x=1788983246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=VBYu6evuJjjK+Gnl1XEGodigKjg18MHrnHrbKmkKr7SnNHULmdGoEQfB09hZ2Wcvg6
         YVdzYKnEPi7hsUsGtoVlyYA6UiKH+uh/mA2l+etm+41tQDbHWDjwxha9a2Dbw2BvdY+h
         5XIVe5vdfjTVMGVxTiU2wzkqpiJNsM4iOoO+dxWNTU03O0auTcWMSbVgSlQETDPdjsb0
         mzLHcBaJIzvIIrsdNIctxc2J8QXjUSmT/pH6qEGdNWtd1AXwy8EZ1FiEtTmj6gc7Qu1p
         fDRdDT7ebByMfDQOfkS4jppjBVp1xZK5lT5N1s/enkcYjqH+vW9Md0tE+hFt2sfMmGdA
         SmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378446; x=1788983246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=FqwNLDuag00wmyT0iWujsEkk0xdxlv34YN4HsRYVXvalStZfpZeyM9gu8PbVt5jsP/
         xhqlHzmyNdzjczn813QhRR1KRUZ1/11iTuA5ByLBdS7EKJUFi1kR+NHrrgZQfy8pZtXM
         u9suKfGEoL673FUk1K/se4lFvOJZurR9GyTxs05Aq2L0KNNQ0ReSeaiMXeW8afvo8xO8
         n63GW8r2AN4bDj1z4DNa8KHglyzTGFwuH9sdFDGmnq/ur4DbvMpzb1eYIK25NM6znc/9
         5hoW/2b1iffgjmVf/IS10hfeHns3R/IfqvlvbQEDeh5Ipib3YaRhYigw20D+5hD09ZlY
         jlBA==
X-Forwarded-Encrypted: i=1; AKwUvBySxOdEUi2Hvdea2IJ8NxPzqhAQHvhtvAUuItiJ4eLW2H5D9Py2cj39wUsqtTaw1ypLGdizNPzOE6m+uL8uAJMs@lists.infradead.org
X-Gm-Message-State: AFuF++n7oqGVMuUn8qnZzQXy8W1OyERIYmtqMUKc0nBKsZTox4ZgNTGj
	1DRFLJZaiQb6jWmKIXx6usr8bSdjrXRMbnhUzB434AJgvqCvK1rTMfUaDbcmAQ5PE4AQ6Jvyb5m
	kMcN4PN/PUKhymGCYl8zrkO0g3hHcHgzqUlVeKd47WGDmjjvvM/6mCnlLN4pMA0zlO8KeLgsnpx
	UYpw==
X-Gm-Gg: AYBFou1hJ0ZH+hhCDk5rymkTFnHwZFpOnfT49chLgb+4gkKrza6nmdt6c5I0uEiBpFa
	9k94rpIOdTkxZZ9U2S0hpIX2L/HGVSMO0ij4Br8O5uaKQAZPKdIsiI1AyTAPO/P2OSJy01gu5WV
	vIlveqLu3+udRH+pOm7mnITHhawnLeFvDRfmKe3V9oVdVS3zoYpBwdNu51jPgee4EYG/RXVv++S
	jw3UVMJD8eeFvThY/bYOsYSTJpxGHh9fmarjLvEiq0EFW27XT/SCy1fJGj4oiE7MytDIn6OjZLy
	7mdyJF3IfJKkeLyf+2kuuyI1jjbABw27pH8Fpa15vObMdBQwuzWaBWwo4vO6wwEVMZBWiIqNFZM
	FIVWtyOvofDBiVEMy0kw16egAt7c=
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917523a91.10.1788378446095;
        Wed, 02 Sep 2026 12:47:26 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917460a91.10.1788378445546;
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/12] ASoC: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:00 +0530
Message-ID: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987d4f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x_sJgRSeZ0M3cdfWgbwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: gzT7UyzqAokysQWTObWXjqJ-j0oEifbN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXzh4lE3EjQDkd
 ZdPSgAIUuUzlTfPy/MdhOXPThtmrFSd6Mq69D0HxJcqZKUlptC9skv90g1m6a06qePPcgsdsfB1
 NQg9//CGpPs6r9ACjxLoM09X0cRHjtg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX3eEQZBrA9yjl
 KEVcSyk2TXOQy+ydKmS0vFjdGmNVFrRxuT2bkgJCCAAaQYr52ywZ8PT1mfuv3GsNPO0sSet92tx
 OdGPXAxVWaIKxNWk+iQcVEZqd2Po/Gdpduqvm6nZOeT1AKbkpTQsjGDW9yyttgcz2gLVBxnfVaD
 EpbHS1VjrwIbUlLiTDcV1zMGNf49FNI/dig02UA4hPK0dRLNzE+V4g9Q9j4NIAz1BuhU3LEPrNV
 0zBKLTzitpz2Aja0rCwGmneEfkd6EHfZ6vtN6Xbk3EJJ0hFU7wiDYqgMs5wpnRP3mbT0VmyAI0G
 UCV80UqXKryfrRPCFF8jddnGA8dPvz3U8Wv7A6hqhaRv+NI2YzQxFnIc+k7F5iyRp0mkLBWn2+u
 Som6/m1ceEgQYwKasf/ncdbcuM1QHVJArs4NcDBmStCOtNdbboZn8cp3AF0tNCmxjhcUbClPGVT
 5YhkIX+TD7W1ztkJCwA==
X-Proofpoint-ORIG-GUID: gzT7UyzqAokysQWTObWXjqJ-j0oEifbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124728_387708_5F9F046A 
X-CRM114-Status: GOOD (  12.86  )
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

Several ASoC drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. This pattern is fragile: any error path between the two that
skips the release leaks the reserved memory region for the lifetime of the
driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
ASoC drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried review tag.
 - Rebased it.

Mukesh Ojha (12):
  ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
  ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: sprd: Use devm_of_reserved_mem_device_init()

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 13 +------------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 sound/hda/controllers/cix-ipbloq.c         |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c     |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  2 +-
 sound/soc/sprd/sprd-pcm-dma.c             |  3 +--
 12 files changed, 12 insertions(+), 71 deletions(-)

--
2.34.1

