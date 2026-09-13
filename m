Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98955C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4caHLEBEOxtFSlC57AtIBBtI8i1ci+K6n0fqXOkiksY=; b=xPhJqqQHBV9AdYR4HsxlAtB6NO
	6z2iYbKkt5gnwOSHKbHMSfFg323QqMto1ERJrd3SQXdMbRNZA1DT8XyRmNt+snYjGo1KRd7Itw1cd
	eYcFiRsU+3HSiyxt/+vABHTLxmVbfp3nc0h8VsEVQ0Qlp4ojNDEZkm3rDJrSiInrRfmV01V4VUToB
	ICteKcUKXZjKzfn6AGiVdyFUDcNkKQExPTau0HrGqTcdKYI1up4Nn+XccHDAmchKvIVO6uYt+8Qob
	A7/kkjvJwYqGYgLBqkmX9pG5i9UA3YS8q9uSz7Rop6pL0x7epPmM1OomWJ0raTvytrKEF1qpiikUa
	bsQ7kO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gCW-00000001Xcj-1xQX;
	Sun, 13 Sep 2026 09:08:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gCU-00000001Xbr-1GNC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 09:08:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4843e397f74so1348154f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789290516; x=1789895316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4caHLEBEOxtFSlC57AtIBBtI8i1ci+K6n0fqXOkiksY=;
        b=GymC0Hhu9vM/BStQXlX1G0rIlI/2qSMAC0kGqf75Gm4GwuuI50tkaqy2tm3YZgB0QZ
         7/RwGlZYXK5uHVpN6z5oxORnicW3YdPaH/UPsFKHcaSq14ujOAWctss8dz62x+nf7Wki
         y3aQVj+GBEip5awDc0TzZhKddLMDrnDyhTW7UMrAOCjjP/UszIIndXzqVUSuWXITKXM4
         f6VyIwMMTsrCTxdbHmLE36h1txt8hlNM7lCBleMt4oWdtMaXbQE2ye3cEr0GHBeAky8u
         zbyOpldFEot37Gkld9299+D2fTYeET6ZnKFhp+n4+ogG+Y/+jTk1AmrggajJoAQhdKmN
         mJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789290516; x=1789895316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4caHLEBEOxtFSlC57AtIBBtI8i1ci+K6n0fqXOkiksY=;
        b=VT0wlLm5g775owNyF9cYTAB21bFlnLFGZjlII/LgpZtqMQjiW8Z7a7+zjpj4wtTSzi
         ecqLB3KsDVFLrUWF5zlnRCKOYd2UZq/v9b0E1ZnCXXQSWD6xdX9c/Csw2ca/TCa1mr0Y
         gXfb7mzt38PGTQX80bLMkdF+A+4luufTWvAyWEjpUMm4yt6Hz87dYqTNTxgsLjpAcI21
         NVzvouFkvmtr62p3JQUalpBpKXS7RoTq7s/24erDN/8g9iRS5C+iYT1vvaky47GuIc89
         SwG2gdOoZ2YbFTjtkb2rBnbtXpdaI6xK5sW5O1SXzVwJBdNYK3wjT3pTY7ShWaR7vbWe
         KWVA==
X-Forwarded-Encrypted: i=1; AKwUvByMo91PFw2X9+ZkIq1G6vmv8MArhzzji9o4D/Vp5snDXMIMrvEnp0VKLml1kQnqHIgOpzSEwdE1zJX4vLe7TJjS@lists.infradead.org
X-Gm-Message-State: AFuF++kQZjNiAkxJrvwcTQmLNzpATmjEjQ4+gvaE3ozsfOYIySdCGS5j
	Nb8P36ArF/wsf0N+/RuaF6l5HJLGE/+fT2fQMbxeC2tc036BlG+yqu+y
X-Gm-Gg: AYBFou3sDYzVhIa4jppu/G4b5v7JEiwbQkj5/qQ1t3NWM6StCdXNJg3rmbCRpyOB0xP
	WCi8GZtdyqB6KKfX2W4xTsqHa6DoKjjJjITVHYWEkhkjQsYVivwxxFXPDy97hLyTzLvi9qrCCTL
	pnKGTAXZYNlKh15XFNLCvqtzMX1pMfLZNVujfIgz9yw0TPekxOtPEH5j5nD2fVITUav5PNrvfNn
	PJmwSSqGf4wsWcCzDbfwAa5WFszYFpYoWZRp/aOP4vqUKs6NtL7N0TMXtS8v8ETa4GhvMpUofGL
	HMPF2X/TKMo+kdxsw8mYiJGOKr2f0mJ4wdprzZjA3pcFYYWF/CUzfI7/bgNPPTSf599Sc5mflkU
	x3icZAHUCcAZalgOuZnqnoPp4qybV5354SeUzER0ZS+7QMgn7D7d8xG6DPxpFLcJsHnldNhwqnk
	DPxFAbq15lQYNKcMCEGhozlIphEAqBp8cU7heoPj18PIFjfKqhs+4ZOQ2iFRoNSQ==
X-Received: by 2002:a05:6000:18ab:b0:486:f1b2:cf44 with SMTP id ffacd0b85a97d-486fc955e0cmr1787905f8f.3.1789290515586;
        Sun, 13 Sep 2026 02:08:35 -0700 (PDT)
Received: from cachyos ([2a02:8070:6286:900::a57c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm19704385f8f.27.2026.09.13.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 02:08:35 -0700 (PDT)
From: Cristian Fleischer <cristian.fleischer@gmail.com>
To: Junjie Cao <junjie.cao@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit
Date: Sun, 13 Sep 2026 11:06:27 +0200
Message-ID: <20260913090744.316095-1-cristian.fleischer@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
References: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_020838_359982_4DC71999 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

On Thu, 10 Sep 2026 09:23:00 +0800, Junjie Cao wrote:
> Some ASUS firmware includes 0xff values in MTGS power slots.

Same failure on an ASUS Vivobook S 16 M5606WA (MT7922, mt7921e, BIOS
M5606WA.316), kernel 7.2.4 with this patch applied on top.

The DSDT carries MTCL version 2, MTDS with two identical tables
(1A 19 17 11 15 10 12 12 12 12 10) and MTGS version 4 with pwr 0xff in
every slot (offset 0x00 in entry 1, 0xff in entries 2-6). Region ETSI.

Before, txpower_sku showed tmac 3 for every OFDM/HT/VHT/HE rate on every
channel; the AP never answered auth frames from a few rooms away and TX
sat at 6 Mbit/s with ~3 retries per frame once associated.

After:
  5 GHz ch 36/80 MHz: tmac 29, TX/RX 866 Mbit/s VHT-MCS 9, 7 retries in
  776 frames, association succeeds from the spot that used to fail.
  2.4 GHz ch 11:      tmac 30, TX 117 / RX 104 Mbit/s.

Tested-by: Cristian Fleischer <cristian.fleischer@gmail.com>

