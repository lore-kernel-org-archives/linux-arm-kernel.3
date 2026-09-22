Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B1CC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CeLYcx3Gh4T3X/EaL6eH6T1aKZ2rWDMD/NMdqi5KPPc=; b=DcWaStHI4jshdFagsCIJrOuaUw
	KhhVKiTpSpz0GEN4ow0nuGJ1psD9P1nMan2KfSc1HQ7E2tEH+Qp/B4ONdh6j5MORqITsA09j+e7FZ
	CsvVVMr8Z2w90TqDtIPnOJBf9xdBlOOjFyvjeuvHOR8dgj6BnnwHEgJ6d9A9gaSqCSWcYVDxYKo6A
	rbB5crVg+Le8bBfuWwAzs1G44ltIpwkuFPkHFjS5G8IcA8lL2/mILn6cJV9mTNyk9cn2hjsKCF9sM
	7Eb4Htm51qeVtMrS0Kb/EJ9dPZU7g0+fPNnc93dV7LbezWVwIoPGOvf4cZ9oGStsLGN5ArjBV7gY5
	+CrL26kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zy6-00000005MvL-2ON2;
	Tue, 22 Sep 2026 12:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zy5-00000005Mua-29ON
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 12:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CeLYcx3Gh4T3X/EaL6eH6T1aKZ2rWDMD/NMdqi5KPPc=; b=iSEYF1UcxjUs0Q93zlP0SWFmxS
	N9WnT1O2aaM6XXZRLrqox8XJm4hopVhfA3s84+OItzktv9tfQON2lPS9BIp4JDoJ77hfQNU9OjdVg
	zpqdZiMrcbQDPdzpLNlA7Wpfud5uaeu3pQxN2aW3Knh2NQ6AB3n5Jt62B2JB3LFgjvpvPLujbIdcu
	cOB8ARG1zURBMNHsHo1qsLZYHG5OHfwMD58bYA2ogM2Mc/WVf968jm1d3bXQLL4bJONQZKX0M+w1n
	McNYoo4fYCWNH9gXAesTGMfM4x+tulliHyBxx9yKIT1hz27DYoLMOCguKEkmr3suQsEnVwPQGEAoJ
	knsCR9uQ==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8zy1-0000000DZp5-2YtF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:51:28 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so5329145a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790081484; x=1790686284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeLYcx3Gh4T3X/EaL6eH6T1aKZ2rWDMD/NMdqi5KPPc=;
        b=U92aFyDRdocFK9tz75klN8BbInl5hmPFoE355lXXTFgd03+fPdRy7DZMIrp3jlTKXP
         5O+fmYhDXws9gnAEL2rqBxevPZrWyV4MNoness7HuRdbvyqEN9EcNv4Eg7L6sdBQ63ca
         mhvPcaa7r6uY27fFz+u9P+hygwquF2PTaLXqbKK3qWwJ2Qa/UTjH76/p/kXipTUV62Nn
         O7t36m/ffqdVPHlDlHi7o+DNpv9T0+xbUZQmoALxssMORwIHn3kzYWzziRPdUax5PbVc
         KM3w8W+w6dmRvP7SJUwMmSl6oHJKBspqAF0WJsDNqCJiewhrtD9N9+L0YyBEgGLK4LKv
         Zwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081484; x=1790686284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeLYcx3Gh4T3X/EaL6eH6T1aKZ2rWDMD/NMdqi5KPPc=;
        b=mCZVvnvndty7Tji8tGbakTrqqBSEixjBSfY5MceE024UAEWEny8upYWePNUOs4Qo6s
         PCInx1TE+IoTqMy88HC4NjGZGQXbGpWQBKESTJNtfjyPA+Azr6F2uTamwewXsrnYCaqd
         akMZuX8LPfN/TRRA3QoJO6R25tZ0vKiLPAsFr0m3DRpSwR4vcnRTRSlV6jEg2Emtk80C
         7ohCD5uYrbWE3F9hMqmZanOSGuVoUsRChKssdqaJTYdgHfphAedzkS7yhy2f9EifOgjf
         BKTjJH9rGrQmomBsgDqNQTX6wLb4Ef3bI7FzBh5uc6e8Yz3W4pNU+cW8ZKAqWSA4S0j0
         kAcA==
X-Forwarded-Encrypted: i=1; AKwUvBwzEo29NdbklKHE34nC/GaB+ctobC7rpQHtcdauKkOdR4vmLzzDrX67ETs/0PggcrzccdPUq7vpt4iATvNbEyd2@lists.infradead.org
X-Gm-Message-State: AFuF++neqOl+yNiTek0BwVBp9jcLLmJaDjhRXER3f5ijfVMwHZOkpgCs
	02P8sS9gO0nj2gZYbOUXlIKAO1UjjwICNh4h33oeBxCTtDaq7wR/A4HCXOl6xqbtoTo=
X-Gm-Gg: AYBFou13U1ZIo30i26bpLnLfml8R7DbKg9mq91nvYdRqhtK+xtVG3tYnF+EE7gfxfjB
	m72zt737Jd4ClNXGqSW2sOcR6kTAkNOVPzpnyrpl5zfzCtnLQtnV04DcNxbQKqf8zH5C1PNd2GL
	65AIWtOYld3KQ8ccnEQpBS+RiLaUQwBvf+7N0DDqOcM47D9KssQytBj4TLhgIFG4WE1pbizSOGk
	E42G3W0zty1BPze0famRWTMuvJWWg3LKVtMGqTMy/HUYw/yq4+wTEjPcRk/uhu1BAv3UwVm5BeD
	FqsFb1m+oisEyOu8OSX6LrM6tXyIYO59UEW3ELfL8Htt/17NrLTJabCz4YOSFr54YTnRKSasWg9
	QlhjTeEf5T6p/TUlx1f/aFGEjrLFMeBWtlzA+CWBHi6FoyGgFE/UH7VTxIWY9im76O0kz9H3G+h
	1rpGbZWY+dpl4474gOUDb55T+DDnwHpmMJNi9e3sWQ5+c3iSr3ZqoqeX9TXNBj7LkheiMXdCO89
	qWP+WQbqphnIUr91NYX262L9tdjnQFU0VDjVrpeAjCJG5HPfA81EvaiIvVsqoVMuKk/v/LqM3nR
	yGB7Tq5Tjc23et3QQJSA8kPPB+/C4MRwFAgDIQ4=
X-Received: by 2002:a05:6402:23cb:b0:6a9:a628:1402 with SMTP id 4fb4d7f45d1cf-6aa545f2154mr9706503a12.6.1790081483728;
        Tue, 22 Sep 2026 05:51:23 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-163.xnet.hr. [88.207.14.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44d1aa9sm989196a12.10.2026.09.22.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:51:23 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next] net: lan969x: correct RGMII port mapping index
Date: Tue, 22 Sep 2026 14:50:37 +0200
Message-ID: <20260922125112.2111256-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_135126_025717_6D8A2C3E 
X-CRM114-Status: GOOD (  11.36  )
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

Currently, the lan969x_port_dev_mapping does not check for RGMII ports
and just returns the physical port index.

However, this does not work for RGMII ports as they have dedicated DEVRGMII
register space with an dedicated instance per RGMII port.

So, check if requested port index is an RGMII port and return the correct
DEVRGMII index.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
index f3a9c71bea36a..bf5320c7a6ca8 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
@@ -142,6 +142,15 @@ static u32 lan969x_get_dev_mode_bit(struct sparx5 *sparx5, int port)
 
 static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int port)
 {
+	if (lan969x_port_is_rgmii(port)) {
+		switch (port) {
+		case 28:
+			return 0;
+		case 29:
+			return 1;
+		}
+	}
+
 	if (lan969x_port_is_5g(port)) {
 		switch (port) {
 		case 9:
-- 
2.55.0


