Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67737E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNuwQd1RTDifL3kBh7TVrenqe8NDNjhLibNxWzojEbE=; b=ETyDr9lC/MrNYqHd5J6MGvKRmC
	i2gGMRZXw3wpi4DekdBBL9eDuWTwxiXiWTjZDFwu0mFbVrSuFUTRZ5PI9zzW4L/febJxx1GnTq3Lm
	c+60QxnqFoEZh7+rVQ1H5JR11PQcTJv5FfZQ0aAOiZA+YfioHTcJrqjrviQ7qu3bTZedTZ3oUwDe8
	Bh+RjaUXzNEWlamJaXzLys0ND79muDoi17RGisy/9a/r3dInK97gR1XN2lv0RjKQdBCZ1skta+sxO
	W4OxqSm3Iqipm3pzeCP4f72XrD4iL78BPab3TblxICkdNV6v6VS1BzC+tNCGHf5eVCwQGGowJx5nH
	6JbhixoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHq3-0000000GEoY-3q8B;
	Fri, 10 Jan 2025 16:26:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHh0-0000000GBsn-3Yga
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 16:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JNuwQd1RTDifL3kBh7TVrenqe8NDNjhLibNxWzojEbE=; b=BKhgaNRB31dFCLNR8aqtzW+aja
	xwFTHSBxVNt+5EUnAN1HqDkHoyyvbrf31Z7tsB1ZQEh3y5JfM+9tQ5+k7wDvtdZ1DHN2f9VC9Yvzz
	wRGlI4pG+7kD63QWd5U2rBXgbHKyaBY83JFzRB6IibFRwd84ciJTLIf/n0Po3Q1a07ksdpSSsRYGb
	PiperNILhJJblM6CYwIkESwXaXK+4WmQXdPyk/P/+5lHYqtO+bHnketH/DmiDQLTlYRyGmH9ORgmY
	sO4HZ2yIWyvKt5FH8bMpsa4iJW+gEsoHJtknfm805NlN1CqKl0csnH8blfmToRN6Xla2oKX2tW7n3
	3jNIiYWQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHgu-00000009q01-3d9p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E8E85C0F89;
	Fri, 10 Jan 2025 16:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF37EC4CED6;
	Fri, 10 Jan 2025 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736525815;
	bh=Hsn94PEo0R3i4HiXq7uSmEFjvZqlsAwK3g2CFIlPugY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJ5VFsCF8PWsvnTs+MCd82moyZ3DnqsQutPsuIXUmYMoZThrdfA/99NXkarcZt6lz
	 8z9+6O6/zAuNe4Jb/QOImshE8rpgxAsSJdpArbHYWwaaW/eHGRG7TWId4NVCQyH5nR
	 yVwG3Vo7UjxqdBiB1aACuEfxvKgdv5aLDdrZ4diY/BTwHI5+d0YXo3eQAPB8IcGsGI
	 /qgJ/kSj5wIZWpu0MmbskGDRL7hjeDCeKi8sE6BfwdCyhvjXNF1SuYtj/5GIwRhdlD
	 nt7gKUd/ImVzG56+9Q2W3Gfgd373GEmDSwZEkkiNqcZmP/irORmpAw9w7X4JwUVBhX
	 5Qxzthhd4IlWQ==
Date: Fri, 10 Jan 2025 10:16:54 -0600
From: Rob Herring <robh@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250110161654.GB2966768-robh@kernel.org>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-2-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_161659_930417_7C224649 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
> From: Parvathi Pudi <parvathi@couthit.com>

Also, drop 'device tree binding for ' in the subject. 'dt-bindings' 
already says that and subject space is precious.

Rob

