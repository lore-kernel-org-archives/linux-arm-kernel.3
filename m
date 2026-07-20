Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB0C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=; b=eWURqZ78VflGeWXT/S1aCv4P1S
	58of7fKsDeBTv4jH9UOeIwkv+KaCe0cwdmh1setaH+KiL3xiS3zoBRm5u8y1Dh+96BQIih5m9noQV
	AFs0ILECAWOZubiNFiJPKmlLnQ/kfXFxArgQQegYSpv49cHHA6yz4X1M5b273ePqJW+UhN3TyNHOB
	iEJN9cvxjBBaL9/vTEaPmL8zDNfxH5OFD/PTz0Qnm7TurzcMj7QJwmR6riAAjVTEqcXwwROU+Pp5r
	8dofv5EW2TlvJqy7r/L6A+ONW8RRX6dax/jpSZCEeQMkARx9WOTJ8Lzg47dsTHrdaQaTAv0NUFKz5
	VJ3G972g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpN-00000006Fp4-0r3R;
	Mon, 20 Jul 2026 08:58:21 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpK-00000006FoK-3e63
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:58:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84864086bfeso10438553b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537897; x=1785142697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=;
        b=BwDc+Szn2lweApjqh3FPs1zd/kOHERPgs9H311opgp1vC1sOAdS8M8e43pHoyRF78G
         eUOKjUow5mmbY9uGLXFdz9mrkeivLtlbd9UYyJRV6jHNijgwXutbTbF4XldDN9a96pns
         YhzXm3Z81WzvYwJwBexDE3L0myIDffYDPEksQUXPlKtCTpGxQldovMQnFbvP39CCL1+h
         8aYqJiplZ3j3syCSOX35Wj17Rg7NH51MKosq6AQX2PwyHqvWtfyoXBCKSN465iK7hp/m
         BORb4X8Wx0Kg0uuOCcTIEQdMLwPetCixuZ5Og8cmZbbkxCuH0yKg8DHdoIoAnQGBGcBa
         brgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537897; x=1785142697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=;
        b=SMExV7CikjZ1ZwL6tv1VaNNjBWFRcOvx05GziH8bV51nbzNTMQ8E2jMbvQHlIvBv34
         k/akyKTw2cDvuTT0vBRGWtbyzdU0hLjRwuzu32BJUJQRQgjGUeM6tT2pMzH2WWxvvSMN
         dP9XipjUlyhivJPJTPRdgqNoexWH+wO78LYqx8prnsxpyUS7OR4an6TEdcTsR9LxUpO3
         zXr7N3Vovpb0RVelY6gtIKAvGtuLOvIvx7+2vUU8NYiA9hr7YvYhq7ySMxYXS8YzktEB
         LeRRWOVQZ9ouISMqNdGjbYSxZV6K4fa5ok2wh4OGpJSUiU5BQykgbTQtOmX/E8YJSosu
         +GMg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5/OW7/CtHxtKwGywbaA7veclKvd/T/fNtfjuNIJbNOjygTAfKrEHBm5wPGuwcd+Re3yUL1BFjD78Ki0/mAm4K@lists.infradead.org
X-Gm-Message-State: AOJu0YwjYofiLM4Iwbb/yZsyEMCTk7iGXB3AeXY6hB4epENHwIngcB5x
	814thgy06Qxk/Sv9hxXOy1p+1yUJLXQv032riL4BKdQLxna5hBe9CwvL
X-Gm-Gg: AfdE7clQSVbjKZKp8K/EANCWVBKCVQPvK6UPGHT7wq3jK2uojwptg2Ly9/9bmjJUQCO
	OcuAAiE+vKmlv8ohIU/KnqbzJhXljZT0ckbTkDSUG07umDZfS637v2Lu5CALOkKGi0/41C9Tc/6
	acrX5KWvMS4t+lqSxjJGJgq3riYDFz5HiMCTTImJPMZAbLqpe0mfXAXeGbHj8tf0FwgtxKNzqCD
	tqZXO8KiaJ7S+9E+lDN87/qAkpz/9zEQIUs8/cC283GEW4P5IjckLw6XQdqIcdLQkQ861cUH7ua
	01M5YDky9t9HUpdtsdg0nJwF5mUSW4hV00duzYvPhT0KKlXKkzdFfMWOAwc6g3MWBaTY7wC6t9e
	/DmZez5IODw9FnyO5Lia1vmn2XgVqIdIJYyzDriUffR1OBdCYwYW4ru7u2Gv/EP4cZVQ=
X-Received: by 2002:a05:6a00:a96:b0:848:64fc:510d with SMTP id d2e1a72fcca58-84c294892d9mr12402258b3a.45.1784537897395;
        Mon, 20 Jul 2026 01:58:17 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] media: mediatek: unregister VPU watchdog handlers
Date: Mon, 20 Jul 2026 16:57:53 +0800
Message-ID: <20260720085756.465667-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015818_908415_7B0D7E7D 
X-CRM114-Status: GOOD (  10.99  )
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

The Mediatek vcodec and MDP drivers register watchdog reset handlers
with the VPU driver and pass driver-owned objects as private data.

These handlers can remain registered after an initialization failure or
device removal. A later VPU watchdog reset can therefore invoke a
handler with stale private data and potentially dereference freed
memory.

This series adds a common helper for unregistering VPU watchdog
handlers, then uses it in the vcodec and MDP cleanup paths before their
VPU device references are released.

The series is organized as follows:

1. Add vpu_wdt_unreg_handler() to the VPU driver.
2. Unregister the vcodec watchdog handler during initialization
   failure and firmware release.
3. Unregister the MDP watchdog handler during probe failure and
   device removal.

v2:

  - Split the changes into three patches as requested by Nicolas.
  - Fix the extra blank line reported by checkpatch.
  - Carry Nicolas' Reviewed-by tag on the MDP patch.

Guangshuo Li (3):
media: mediatek: vpu: add watchdog handler unregister helper
media: mediatek: vcodec: unregister VPU watchdog handler
media: mtk-mdp: unregister VPU watchdog handler

drivers/media/platform/mediatek/mdp/mtk_mdp_core.c |  2 ++
.../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c     |  6 ++++++
drivers/media/platform/mediatek/vpu/mtk_vpu.c      | 14 ++++++++++++++
drivers/media/platform/mediatek/vpu/mtk_vpu.h      |  2 ++
4 files changed, 24 insertions(+)

--
2.43.0

