Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB397C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 02:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRHb99jNPH0UFBX2I07pqGevFpMjZ1DTdvtyfpI2li8=; b=oocdBZNGRh1EJDShBDIrOAV/E/
	4vIgy/89BAbvnI4MZ+Rti16/aQMN8xh+dbO7kpsp+ZjROxiv35MN38EfYAXkcxEojfTxidPDTvsYN
	Lg/mW11I3igL8R6PTfoc8GGZto9HT67lteFoHiGsEQS3C7Cs5NNgBzs+7dyeMH+DigeaE/CxPtiRm
	hi9BMQsrjN3kMiCoxEDzlNSiFrOypWkbF9RI1ic6++HpsgdICl6MOByGv/pSWffPfwS6nXQ94/xJI
	14lgKe73RE3uuL0WnGBJfpAKG0gkOYSlAYmT9/JTkiaXc9o09xv0NIQp12Ld5Pyj2jlAk3OEoqrNK
	Xx2Z6yOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umNGr-0000000FYES-2Ukq;
	Thu, 14 Aug 2025 02:00:49 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umN4V-0000000FX7o-17vQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 01:48:04 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e57376f655so1554695ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 18:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755136082; x=1755740882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRHb99jNPH0UFBX2I07pqGevFpMjZ1DTdvtyfpI2li8=;
        b=WqxUtaHOdlr0ZyE16sX8+02kE08M5zHBE7luduvazXKdB1m6ZiSZyMLvN4cHo7RHHU
         NIXZnWLx/YZhnsmWTz/DSvIniA1Mssq1/W6QFRho/Rx/YCEldZon8m4pohnnpL7s/Gx2
         sRTm5z8iFo5cFPImWUx5rL/VnaBgW9zhH1fEyLb4AeIuq8kPyVoYmDIp/FLBRr0RzTAe
         WwqEc3heqib/ZfJhH6SulfM2nOvuzlzc79o2OcfuITyrdne5Ye3gOry++GhF3S+8QUsx
         C95xFHjIn/wrMJ8oNvmjOkk1/YReHuej+P8kKOONQ2/jwdToWk7AlH13MWqmgAohjnp+
         gRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755136082; x=1755740882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRHb99jNPH0UFBX2I07pqGevFpMjZ1DTdvtyfpI2li8=;
        b=UN9T68xYqE/R1X3ldBdH92G2oITF5s+ruDLFWJzC58QNLOl8v2lwF+xbhzDU7Tqosx
         qqX3UMflqvrUGHE2zWJBCt+FdDMpfAmDFheOZLcf7038Bmg89ePPNd5l3fjUY+rtmBXB
         J/WAI8jR4tb7KUHdCEbux2P3/hTv0g/UK7dJuVpTNlwOkWlK1zZKz1NHK6hnqzbdFvCX
         GiyxidUsRNbsnYa1vVgFxHFiM7xxbl1CxZwHT4e0VJtkZlwSAzWMEEHiOochyrVFvE99
         Q03PB8LL0qZzpt/q8T80nSrkDfr3BBj0xxJinFTQPnZJjkY7BcYn4ELluxvnoLeh8oTV
         aK8A==
X-Forwarded-Encrypted: i=1; AJvYcCXzVPlX1ipvFp9U1JdqkBl0wOoYhkJOTDNcJ1R7QhnYmjd4E7cawsOZBWoEEkNS73hed9WfwahtrNNwJ9wXEb9r@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZ8J+DZoxi+KUY6wCc6ziat6sa+ph9MBEV4cnwixOqZrOPE6R
	WNjXoCKlxdApVcjybdK0oQTLKsJYLtu3DNaSDg0ZgVacgQ6cqDoMMoqD
X-Gm-Gg: ASbGncu74znEaOFHwxB+FakbKVB2U5y/Zs708KGMPGTt6Ers9XMUZ7hw3UBAkUo48/U
	AYVM5tF/tuMAxEoODI6HHQzQW7uDLuFvPOm6lyx73tuJaZXBVXwK9AozUNjDELmVvsfFA4i9hE5
	ZqVC+kiIMMWOv0pksk+TfuwpyBYxi0LOntAnVu6XiVJYuG7IOWRxsCjnjXRdddjnU4f1kvIyXa6
	JOzHjacgfyfRAYyEOeBGRuTTlVEydH5x2YRB1JU5Fy9B009bkrFwZdloJNKDzLNo49Aq74BAdXb
	+HvcFDYdu56Dj9WuwzV7Iad2B9nQg/W5auy4aHGBRmQffJbhB1RtZbKHUze05/skUIyRCnQ3xXD
	t/Tv3dzJBMYQT41qtcNKRukvVwN8O3X71HOob5rlgxx5avOqH6EaO9WO7dGpWPdhbE8TfzsL2TK
	qwUA==
X-Google-Smtp-Source: AGHT+IHtXsnK+kBLj28/be1/0hdQ5zE1GehEVJYoBHTHj3XvV+jA9oaNZskmJcAQPEyXFOU+Z2DGEA==
X-Received: by 2002:a05:6e02:1fc9:b0:3e3:fd25:f6a with SMTP id e9e14a558f8ab-3e571e03f79mr17027195ab.11.1755136082395;
        Wed, 13 Aug 2025 18:48:02 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd316bsm3938726173.46.2025.08.13.18.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:48:02 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: shimrrashai@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 1/2] ASoC: es8323: enable right-hand DAC-mixer connection on ES8323
Date: Wed, 13 Aug 2025 20:47:31 -0500
Message-ID: <20250814014731.86651-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250814012652.81424-1-shimrrashai@gmail.com>
References: <20250814012652.81424-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_184803_312291_0009AAB9 
X-CRM114-Status: GOOD (  10.81  )
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

Enable the right-hand DAC mixer connection in the same manner as the
left-hand one.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 sound/soc/codecs/es8323.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index a98229981..3a91713bd 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -633,6 +633,7 @@ static int es8323_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
 	snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
 	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);
+	snd_soc_component_write(component, ES8323_DACCONTROL20, 0xB8);
 
 	return 0;
 }
-- 
2.48.1


