Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB61C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=; b=gpZFmn0yE9BlSjYwY0xDCCRDw1
	8+H+9jsO+7DnWf+oLF6AX50sPD9ArchtlhLT0VgWr7kmYknLQAkd9RWOMI12usryI4LNhRLrKdckE
	y3Bqu5s0erP/UV7gF7cetxfhNTKqfXX2sZeJkfBGCPSfKy+JltvrPNcznfoTest7wexcsGCfD8Y9v
	O8XJIK414Q7MSC+LGZjB+ktMuBf9AUr5XPD5FzhXhC9Na3Uge8Cr7OE6RPnxPjJ9tLBGub8ObW/A4
	MgQrbOE9nAWuS9DDDK9oUPIDobLbuHZkAJlShm4gy1orbtu53A4mQx6j/+3LNGuKmTNs9zpcuG68e
	MuJjYCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwX-0000000FmLx-412i;
	Wed, 02 Sep 2026 19:48:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwV-0000000FmJZ-3wAu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrgaN2730687
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kbPay+R8Ceq
	eWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=; b=B7olY2gJGSIpj2fDG7L2gIFqQ6e
	JT6tYIqewvY8P9NfqErInwKfDOxU65KUH9vNSJx5G2VaxyA9ypw3cZle1gWc6ULB
	gwBBO249bNezUJRRvS73dLg3cwzIdBznUDugkYJIFuI9xUmaMJEysCaimOoCaOek
	i0ifSlEgcSv1cZwp+veeS1PeFh1z86k+PgQArqsL5ZkhfBKZNd1cKiHW1OVacwWK
	dH8540V7hmM/Oy3PIQGTDkGKCxqZ8vjwXZDkMDzoANPs6Z4nlOmSjRO+TN1dmr99
	hdB2oGdoSz38s6Nbqu7u/0FJ9lrvOI9wXJ6XQQv1j8dh0B7Pp5mIduLIbrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2pyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f75c1219so29462965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378498; x=1788983298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=SQc4V96RV5MzjjzxkR5OtuZ7kC9wK104VLSjs9kKPGTXz8tBuyGaRPNV4A62GRZq0R
         owSUbN6Di4NzvPJB9WuLl03R+d6j/GVYoxQVnxb/BOeH/fU2ugWzmLFm7r7nHpmhhxv7
         S/HvXcqSbwHHd8C8Go6TDByS1sbD4ZrV/bbbSSY1Kd+qwJ8pBzmOrmnnDmYQDyLFwvIf
         YaSA2fmAbyWChrj4A6QQbNqTsuAP/sgAFlR2Y6MceoSOLU1B3Q5iUFSXuZd7TB8kz43y
         nYrjMr+cbV8z0CjJDrL9n3WfoPQvqEItGLn3MQK1Gt+zWH0CU5NvW1b2nvlfd976rUih
         9ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378498; x=1788983298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=crKuuhnOsRJ2Qevkt2Ti1criDMv0AOZqK4JbFmoUY9bG0brBroHXTiSODyTttKKniX
         pAyxxrVccq3jwDlg7m9Tv3FGld/quWXRu6XjfPJglUN1F2oVX665kD4g9YXXqd3AYSbZ
         +EVWO7Ngo0SxWNPw4lvOGaDREgeLEbpDZKbyhA07E3vb4iwFc/MZlwF5YpacreMq8j+n
         HnLPqYqVbDjGxiYOmmU++k1l99K6SYDpSZuLuTAwYMo15gj1ZQiep8ebzfouOgBA/5sF
         srWtEj/5peB1C+eTWa/KP46pHG7NtvgPhDV5qhe7zPX/LPuqjnSt7S+xohYNHbL+vI3g
         b2mw==
X-Forwarded-Encrypted: i=1; AKwUvByFUdZ+zGqjeXr3Vo8LuqQlvDgEm6rrGYJGc4zRet8Z38bkbRbtQx1802t/SazmMiuJa1z4FTGyE+knWjJ95YZq@lists.infradead.org
X-Gm-Message-State: AFuF++mgJn9TfhB7ftBDLmc+sr0dSMuxPe5Te/HUkvKd3tZNF6olkBOh
	BQof+eosQiG1d/aIX7IVFSgPW+lgT8eughSQCpL6uW/IxqMlgs35q6R0qQmaWb6sCUrUiMKP/fg
	hNDeeKlOuuuyyFQ/Ks/LGKzYQe5dDRWPKYgwMdzFpbSSqwjufAES47lVw7gA6mjIUsr/GdcTKQd
	cHiA==
X-Gm-Gg: AYBFou2+CTPjovI2GjIt/TZplpy5ZQB23Tq6IE933HF+CjsX85dp9gcn8JBqdn8waXj
	4YIpqlSx5S2UCRg1/oeknO8XeQnwqVBddg7JaixfQrkRXaueA7n5IHDwWiseKLpNWwklVeF5LLB
	SQRuA9jhefOd7/wtXqxp4qz9J3mjx87qjuKLXExn3NSxnFwd4iFqxJLZliI0/Qy9YZUNaVTkm93
	4xQnu+zjPSGeOx8oeVR53oYVCrEQ6uF19aOgTiRblgOYZI3HJQ7bNEButWKmQfXARXUTkZqz6BO
	L+JtOBilO6XCh6n22dNu9jbu2cPZYwmT9gE/BbmuznG4MFawoyqs1AklF88d/88+WyIsoaROuC7
	3opB8BaUC/+36gtEFnassbJ+YXuA=
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108998715ad.22.1788378497932;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108997865ad.22.1788378497411;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
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
Subject: [PATCH v2 7/12] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:07 +0530
Message-ID: <20260902194712.2003414-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987d83 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: yDeGWVDxZC0KomjBKZwrE4Pl7q0-_jfC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX4AUJRRbhNgBW
 1lZDGhlMvfhf9YSIz2NrPsgwkQikXsDNuFXyg8gOzhyKTswjFYXl1D2dMG3qqEAlhDL8ruc3meX
 /wPaJfqul0hUWCD5POnVOPPkY23RqCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX9D2qyTzcUIx0
 KVJJr85bBeCiV15XAzS+m9sZakbvLfCf+YyXCIhJDeuL9FWPu9npN+c9ESmgOIXOM7N73nY0YG7
 uJb9U6R6t96kZJXSkoEpOZZUDq+u3kb0I6TUZje+yir3LW5GCW4QZPi3e6mt+Wof3KO9u+/ERg+
 s2c8Yk1bCPLTFoddMyYF2cI5Yo0Ai/Z19+/prfd2reyzUdOfFSKPUF4yFdHmNZVLVaiCBApG2cS
 2tkcroVbUTGT/wexShINR5WS2dOXcfdoxIVAUnsZekngBrjy5PJFgFsZFvUbwOquaO7tezD+zJs
 8ZMOY017MI7ua3qG2qXw7TCOLIyrqP3fuAhvnz2OB3pGBYzK/0JnFfZyN/OYaMX/9hEo33IOPoc
 7A41WNsm7i1CDDGL4cN9frYw4enMfaqwg/48jItgHXcmnShSsuK/z+Y4Tqqoq8rmd+zw0BAPUko
 imOr8D1Wz8/BFwepfBg==
X-Proofpoint-ORIG-GUID: yDeGWVDxZC0KomjBKZwrE4Pl7q0-_jfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124820_116372_DC70548F 
X-CRM114-Status: GOOD (  17.85  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0


