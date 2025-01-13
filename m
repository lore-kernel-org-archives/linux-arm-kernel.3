Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC67E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZu9QqBriWk4/CpGcgr7d0di4oBFieKVARWfDfbeYoM=; b=kmPqSOu+QzhOfUseo8b5ZxmHv2
	gBjhhPD+tWbnk4cWbQxdVx3Q4xEH8EV3CihFter3xqcnPJwWKKxyX9/J3NdedBwkZ/YLq774itbw5
	g1bN/vCOjGEOE0PppFpKdJcuW3eqUA4V0Pa+IpyZr39RfWdTgoPrkaisiE8V25HrR5SJ/Jc9OsHHq
	XrVrjIDcqlhDc1cXJ0TyWZry10WXk7Bjq+RaZaBRUu/K0eVF3z+YZOHikuUX010SSqOLmUDd/+Hv5
	OyXLnkxzGueM8er82KO/QSEALi3Q69e+nuJ5kdMoyIbAntZTQfiQyoQRnp1CSZFPwvlmkZUtOywC6
	8jGS/6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGuY-00000004egi-2SKP;
	Mon, 13 Jan 2025 09:39:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGqg-00000004dbC-35uC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736760905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZu9QqBriWk4/CpGcgr7d0di4oBFieKVARWfDfbeYoM=;
	b=Uhyt6gjk8qVjuVsiN2P3mXEv+cjHJKJKZ3lXZR9cgv+JQDxcmtqUtQAgvBfHw9up9iQd8L
	4GoQUjLCNhtIlLs729bGvMM7dLvZcTn6MKNS6uMQl8g7AyY0NS4GR48fgx04oMiO2MJrnR
	mEo717C2M6k+xgTH/uEBaT0KrTkDSrk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-XbKmSvZiMyqN-1QTLEHfwA-1; Mon, 13 Jan 2025 04:35:03 -0500
X-MC-Unique: XbKmSvZiMyqN-1QTLEHfwA-1
X-Mimecast-MFC-AGG-ID: XbKmSvZiMyqN-1QTLEHfwA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d7611ad3so2392669f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 01:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760902; x=1737365702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZu9QqBriWk4/CpGcgr7d0di4oBFieKVARWfDfbeYoM=;
        b=G8th2znJgjBYofL04QqJiqHER4F+f6XpWTCxyszNJnuOcGr/8E34j0MxK9Vh4dMeKm
         643jyPWL51SYx5L4mQTa+MWQl+nQAAf9Ffnzq0aN5LOo3/PRWtJs+6JOZTtNODtx/erX
         4jCGNwndQhYIBdkRimhhGamvGtGthBi/m7jsy5540oxGHy8MiVOJiGOAJ4cbAEc9lmYb
         P4zZ2BP4k5nLoL0Olvs2cYG0l8De/lKeOE9uss3tOuV7vEZaRhB1vJzCMp3aJ4XDJ/gV
         GGX8nkR+pzU6RjJ6zGORvGW9nPewZyPkALwwcnG2mqiC33FpLn1QP+xgK4sxbcTkI7qc
         69NA==
X-Forwarded-Encrypted: i=1; AJvYcCXqm8h7UubpOb6UwvteoB7scql6eIpMyu+isdV/Onsv/jmMtHDPbiAghYAI6ANw3PCFR7swaHSJ9WtUQMxQVnfz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9QNYgjILBjKY/Y5RNJ2dYRga9f2TB0Va9KnKRREOzs+pINtr2
	P5jj1kzXyju9UA1bWT3CyhFWwQGBMWvIy6GTi+muMmg8nCV8NVUleWAvryZKrkpNNNABAYLaZrQ
	nEP3d8/lw2adEkK96GVTJEr4/Ftt4drOmrOmyJDCe1F1v8Lr+pWqETrwEJ97yy2y52cSxo16V
X-Gm-Gg: ASbGncvEvkkxmS+UyLJ6aPEwmKOHPN3S7ncfsUVW0i+F+isnAjezjNCw2Qmjpj4Cdeu
	XwIRWBJ3FJ7GV6FV9pVHzrX3zjzbuMn2RqsUAg8wv2K544NEv7GD77jEBX7cUweDyeC/KSr4YiD
	w2Y6GydcgQGIIfWBlIOg0GALVlykqku/ZpwT9o2YjO+1HahGoG50mZOy3aHvewkdLxpfamd1klF
	xA0pW6R2s26Bhsh6Etw9LJFlRAYAZgJBVkbNFYzzA2t62f/fY6oyqE=
X-Received: by 2002:a5d:648a:0:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-38a8730fb57mr18342360f8f.38.1736760902193;
        Mon, 13 Jan 2025 01:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKWbgJ+p8D2nSL1Tg89dORue0vrIpeKEyO3MQ6XFunbZcOEjwxPA5lI+qzzFC0qFwWNbxBmQ==
X-Received: by 2002:a5d:648a:0:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-38a8730fb57mr18342327f8f.38.1736760901806;
        Mon, 13 Jan 2025 01:35:01 -0800 (PST)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38b15d3c7a5sm5224226f8f.32.2025.01.13.01.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:35:00 -0800 (PST)
Date: Mon, 13 Jan 2025 10:34:59 +0100
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Enforce ETS Qdisc priomap
Message-ID: <Z4TeQ0b2d6vt4AID@dcaratti.users.ipa.redhat.com>
References: <20250112-airoha_ets_priomap-v1-1-fb616de159ba@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250112-airoha_ets_priomap-v1-1-fb616de159ba@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ImPHq3NpsjPQGiffCCyypPPvD2bftGPjEVn3X7c3GeU_1736760902
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_013506_843985_FD01F879 
X-CRM114-Status: UNSURE (   8.75  )
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

hello Lorenzo, thanks for following up!

On Sun, Jan 12, 2025 at 07:32:45PM +0100, Lorenzo Bianconi wrote:
> EN7581 SoC supports fixed QoS band priority where WRR queues have lowest
> priorities with respect to SP ones.
> E.g: WRR0, WRR1, .., WRRm, SP0, SP1, .., SPn
> 
> Enforce ETS Qdisc priomap according to the hw capabilities.
> 
> Suggested-by: Davide Caratti <dcaratti@redhat.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Davide Caratti <dcaratti@redhat.com>

-- 
davide


