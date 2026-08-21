Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57176C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU4uJHeueOdwiNcvNtR8y+Kb71SUpDkuCapRVkW68kY=; b=O16xCtUyjND5h13dZDpbSSI1BN
	9Q1uOk4N3qVxSTSZIhjRT2TMnFb9RTY3VZa8FVePxmdYD+WaM7d1LWv0VqAQiYqDCL8LS01EtZPos
	kGCOJktcAMcGOBvp5RPCICZ2K3qUz+gfwL/X4GHqxyHGssVb7dWAoTezXGCjQUDUASlVih9i7B7M0
	nudQfz+EhDEgOikqWZSAPcanrSx0N74Cg2aT+mgHAHY38ci5EuZMcX8cpRgWa3nH191rxnGHWISe5
	KYU9eauF/PlL76SM8cTdO8ba/t+3mEihb+99KaYe2w85OhhMpoHGx74yDc9QwNy4u4kapaGX6QSxW
	4hIVddDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKSu-0000000CmsW-37Wi;
	Fri, 21 Aug 2026 08:19:04 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKSs-0000000Cmrj-0Ap5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:19:03 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso1486167a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300339; x=1787905139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TU4uJHeueOdwiNcvNtR8y+Kb71SUpDkuCapRVkW68kY=;
        b=rt8DIB74Pz4cGlkqlgGu0UyUT57pPv64itEUb48FnwFCIsUC+AZ4XmZibnaTpK472i
         Lac1p5koNArJXq6hPyquqDiC8sHCsQ7+VnzqI8M0dA9p0Rz6406/qBVNU5hhZ/h3OJL6
         4NeZotAm/AbMU5ZEAesEi0IZAB5M+vwJwmU+UZL6VPcpSR3n8RtiXfeY5IfJDTZ/2gyF
         stVPBb2j+66gloZNJYOXHlS1HYQ25FheWc6jd5nhgsw4mVM7vehfGXaJ+K5jsGObYEzt
         ALReVdSp2qJZ97fEsuw/gOz29O3mmjZKE7C8egt/KgB/ASurnOoqvwJuYA8vkal3rPbJ
         G7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300339; x=1787905139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TU4uJHeueOdwiNcvNtR8y+Kb71SUpDkuCapRVkW68kY=;
        b=KJQKhkzKZTS8509QxZuQx124vJx0HoQE3KNFB760eVArSZTnHWJvBi6Rnu5XRpPY1u
         omdDiGSv5oL3zST7oQHjqmLMaKAwBhX1KhQLZE14efeSYY1l7MSeJ0OUYU5Es4Bf59bE
         W1Mm/8lEhWisXgqiU3gcaBQDz2QprXvb4GYYD09C6BLqiBu2HDIE+OKohJGse/DgqX6j
         r1bWNkRNYA9M7B+CXsgJfQ3Wxo5sN7uJtJr+6VgvwsUJgmP/hGisZFsdMQivdf0fybK0
         BDWy70urVHHkZGbwhMChB7fYUa/vRq3efrzxxmA3YAuqzpx8mcDM/01xu/62BUnpr/pA
         VLsA==
X-Forwarded-Encrypted: i=1; AHgh+RqWjdjH9amz8IGoUhqeKHGM/uXVaDNDDC6g02AL5PUhq242Pur1+LElU24YJcXY6OpFmwJ1KJ8ha9Hdi8CbqUxV@lists.infradead.org
X-Gm-Message-State: AFuF++k9V848LMZesR9KtLfDA4arUEePKURy0OeQ0xJIKZsHERZlM3zu
	q1UPNOWKGftJeXV0PDx9gH1lZImtGRy5k+yJOPeqLAiS0bsKqi3Ndk5l
X-Gm-Gg: AR+sD13c+0m1l8r8m+ZEakBt2nYGRC+QSKFWQ0lfkjtmK1lBVeiFEskc88Nd7n7bjhd
	NBtHjYk6uxE0JM2zDRhUhR7CGI/M2N3hDRbjgBlDLHwoU7k8mjRRYXkmGc8SIlEfHotm6u3C45w
	STDgXsSlOL3qBBqgHSWR06SvpdOtvIr6mARtKejleQtCpoA82O6QnbgpndY+9c/wpzJ9PiMu28n
	WAIqS+9hiIXoxEABjlkVD7G30vKYT/COCHOjxxUGbpZFIEfnLNYAeHr8XO8/pmCphb1xf4+4fEg
	L1rUIMhSiP9bS+1Md/mbFn2LnBhZfEXWZdckrkWSDolrx5FAhs3yLehLAordjB6XokgVn/02BFs
	kpHGf062xPuUxImepPIAulNdTJ7cum5cdOL6jmYopzkOrmuVJoeh8Z70mJ9Eiodhst+6xzo/kfM
	PstI7TdhsDYfUOQ239GCfWNPFVFbanyaPX//+cPBTyPIaldOEv0L5skNVYsVZSbHIKE0Gqqi/6/
	Wvnf2/mQkQeVnFNtimtMiqG
X-Received: by 2002:a05:6402:3805:b0:6a1:1bea:8ea0 with SMTP id 4fb4d7f45d1cf-6a42f0f7634mr5394501a12.3.1787300338853;
        Fri, 21 Aug 2026 01:18:58 -0700 (PDT)
Received: from ca91a6afa0c8 ([31.7.57.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1780c9sm5238626a12.28.2026.08.21.01.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:18:58 -0700 (PDT)
From: Valera Kozlov <valera.kozlov19@gmail.com>
To: bmork@telenor.net
Cc: amadeus@jmu.edu.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com
Subject: Re: [PATCH 1/1] wifi: mt76: mt7996: fix mixed FEM check of mt7996 chipset
Date: Fri, 21 Aug 2026 11:18:30 +0300
Message-ID: <20260821081830.280417-1-valera.kozlov19@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87a4z9f7a5.fsf@miraculix.mork.no>
References: <87a4z9f7a5.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_011902_087969_4772C641 
X-CRM114-Status: UNSURE (   8.26  )
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

Device: ASUS ZenWiFi BT8 (RT-BE14000), MediaTek MT7988D SoC (tri-band,
dual PCIe hif/hif2). Confirmed empirically via extended TX PER testing
that adie_idx=1 is correct for this board (matches Chukun's patch),
consistent with a mixed-FEM design.

Readouts from the ADIE_ID registers:

root@bt8:~# echo 0x0f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@bt8:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79768a20
root@bt8:~# echo 0x1f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@bt8:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79778a10
root@bt8:~# echo 0x2f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@bt8:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79778a10

Note that band1/band2 (0x79778a10) match the EE4600 signature exactly
(needs adie_idx=1), but band0 (0x79768a20) differs from both Zyxel
devices reported so far (both show 0x79758a02 regardless of which
adie_idx they need). This is a third, distinct band0 signature -
suggests band0 alone may not reliably disambiguate the two cases,
since devices needing different adie_idx values can share it.

Happy to test further register dumps or a proposed fix on this
hardware if useful.

