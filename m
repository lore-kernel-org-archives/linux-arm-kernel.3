Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57104C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxRYcCKMAB9BEGfCUUNSRJUQ8AWqDioy7n/wpVpm8LY=; b=1wMNsOBWRXWenRVPLQQYLMYbrI
	BQhYNYZTLDD1cnJ0sJe1KKZiqzkvH+FGjxixxSkE0iU+eiqDduGD3rrjjjQFCK/VLWIqzxW5/+UjR
	egcuVt56JREegQMqJupg7m4u71BjrQKBvthpIGNlqSsBH3MeMRBzZWuB1vpHjr6s82cquB+IHzRYq
	S6HZCut14AiUwAXp8i/arH9inou6TCv/aReBev+elakDpNkqzCaFC3htGS1oadP/hrkCftcKo7fsJ
	IVKHR+hQi6U/ATOfRck/772SBTm2HwITGSu2h7SCWovlerNPosy54wdyeZa3kc/bQWxfsnu5EGS5T
	k4NAPTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPUH-00000008cPa-04AD;
	Fri, 07 Aug 2026 18:40:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPUF-00000008cPN-0iKv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 18:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zxRYcCKMAB9BEGfCUUNSRJUQ8AWqDioy7n/wpVpm8LY=; b=KKf6ASN68ZN4fCf7VicyTPWZqA
	bbfQiZw839HjnEg9Ez0TOaP3LNL17bHXxwbLvptFUrFMJ6YajgfKicFk6cUcEl7v36A/Ol8QJWhpH
	MkFfaYpOBTSEf8HIosM0FCb8JHsyA7gFlUm1r9NuzM5QjOlvWh702yhrbEcmPhgkZu8RX/kK6qDF5
	QEE9glV2dacmY1I7xexzEds20Eukpf/HWrkXb3PUngbGWOkVUUzUCvK2OqdH1pKWmlcqnM3Ro8UIY
	20JKoa4xH4x8DjsN9iWg5TMaGZpiMBg94X4eVC1lf7I/E/NyouWCyLk7BTqVeqvvLZcFyWoNRbgIv
	fclnD0RQ==;
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsPU9-0000000CbEM-1zym
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zxRYcCKMAB9BEGfCUUNSRJUQ8AWqDioy7n/wpVpm8LY=;
	t=1786128001; x=1787337601; b=CEvML/edXr94FlKkgP1Cv6ikjnu/K4idlW2QCx4aIXXidLJ
	ZyUUe4J2OUx4tlQcD69B3mZnT/hQcRZ0F8VXLR5sK0w8oq4N6aZKHlaJUUyKvNvq1HK4pG7mEESpm
	LfjWdobJ/qiwCE41/mGSmAT+I13NE4xzAibgyrRnhrVWkeoLeXh+KvBICHK/1k3+WuYXhwSkJl+y5
	JS2QQUg882TAMwmGg/0BTa6n5aMQky9Bb9q5u+JkHMsckc/7N9CybpXTc39vQGtgvBuQKOKBmXw+Q
	rcsNhj4nZZd/y9NNgZCgYTgusDv6J6bMZ6v9f0iZaHRhnkK60XDNhfe7u9dOueQg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wsPTu-00000008ULg-2sZj;
	Fri, 07 Aug 2026 20:39:46 +0200
Message-ID: <9cf8e6ee9c4c655e685708bc5660429074b18326.camel@sipsolutions.net>
Subject: Re: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on
 WRT3200ACM/WRT32x
From: Johannes Berg <johannes@sipsolutions.net>
To: Georgi Valkov <gvalkov@gmail.com>, briannorris@chromium.org,
 andrew@lunn.ch, 	chunfan.chen@gmail.com
Cc: francesco@dolcini.it, kees@kernel.org,
 miriam.rachel.korenblit@intel.com, 	wenst@chromium.org,
 rafael.beims@toradex.com, avraham.stern@intel.com, 
	peddolla.reddy@oss.qualcomm.com, error27@gmail.com,
 s.kerkmann@pengutronix.de, 	gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, 	krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 07 Aug 2026 20:39:44 +0200
In-Reply-To: <20260807182124.41572-1-gvalkov@gmail.com>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
	 <20260807182124.41572-1-gvalkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_194002_849290_BADE4F17 
X-CRM114-Status: UNSURE (   7.58  )
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

On Fri, 2026-08-07 at 21:21 +0300, Georgi Valkov wrote:
>=20
> +				/* Allow platforms to ignore an incorrect
> +				 * regulatory hint from ROM, so userspace
> +				 * can set the correct regulatory domain.
> +				 */
>  				if (country_code &&
> +				    !of_property_read_bool(of_root,
> +							   "marvell,ignore-regulatory-hint") &&
>  				    regulatory_hint(wiphy, country_code))

You're supposed to always update bindings first, no?

johannes

