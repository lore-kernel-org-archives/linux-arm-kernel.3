Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7526CCF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTH8w0h3kKICWLf+Wiu0sGV5MiSH0o7xe3QPb1+JG0w=; b=0Gcjny5kTlcLWlKwboGLX/lrdC
	eAkGCqqn+RxDqrJ/x9f0+lHT3Xwi1TcvuzFYFmp+B2OIV3CG4/DpeZyC/GwsEvMqhrINmBGkLWhw/
	HCWR4xRrB6V9aEGO0kWKtZ+RY7GnVWcUAyToFwHhs1bGmOx9mN4aYhA5MN5bDevgqD+n1NaZBo84V
	coBa4UfAYFqTqTnrg1aw5FD+CyZh0cTynJRIOtbNCrh9bo4gO9zFyw4tgnxCMpzMVI0HXH6qNAE/p
	OgqzwsWSWqErWXfJFhcj0merOeoeSZkpLvw5EiSjHAm4oROwsXBMuGJqJWGVb/hYWNaQYWxQhvCDE
	nvpoIEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKNc-0000000CNac-2Wtq;
	Mon, 26 Jan 2026 11:03:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKNa-0000000CNZq-30LR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 11:03:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4801bc328easo49677975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 03:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769425413; x=1770030213; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aTH8w0h3kKICWLf+Wiu0sGV5MiSH0o7xe3QPb1+JG0w=;
        b=nQErWVHweoDd6CkClnMk0hqbDXXjbZzvHX4PQo2fbdFaON9HUWcSLn22o0rUtd6JxH
         QPN5k/Nlp0eqnthL0FkM4sIn7F4zYhJp2h2Z2pSKcL9j+IansJvPbtEySzGFkpR1BZfj
         EuGWr+UPNrp/ZA9DdPZ35fTOXRPYbGuAaYRcpnjudsLmCyrzOOcCI9EHHAxsmGSk3rCc
         c6fFYlfPponYAlBYJGfOf611rQSMGVCt4ImqmOAQmvMaPuu5rFLo2kcaWR+rYInzXCMQ
         6x4fnTuVNaZ1fksfF0uPnbRtAjo12TxelvqGvahefwq1E/1kvLVgIqzMvbF0CKsL+ekH
         5uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425413; x=1770030213;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTH8w0h3kKICWLf+Wiu0sGV5MiSH0o7xe3QPb1+JG0w=;
        b=gQFKf38PzqqugtaTMd0jyFTs9129U08X6QrnBEEvaUqY9nVHzwW+GDudXxRBBKHUyF
         Bf4A/sKnuTyWI2wgFZjcqFA1Qp7q+wpdk55YKIXQ3bdnOWO/p5iZ8ADOn0EOzmhcv0eT
         a/q2SunKiYBBneInI7JupRgOhszJe5uZO4EB61omFqZBg0dF/+wkK5TTdPgcwWF6yAcz
         UHpXeKZbJ3/qNE641fbaJtmRonTNUHC3TO9LObD7hdAmDEoJyGwURv1w9o8kUggc9NI/
         D+OyqCAWCTVuYwOz0awCx7dSa/bM3/+/gWhwfsWscbXcLnH7gPZgP/OV4Ra6xqBimrXU
         XQjg==
X-Forwarded-Encrypted: i=1; AJvYcCVe/5UK/6j+x5d/czfQG+x5dlclvHhQvzwaSQwko//tltbQMzxenJkD/nhjvzDwwRSHrFYl7QNvmVlcwegNQJN3@lists.infradead.org
X-Gm-Message-State: AOJu0YzYVeBkMhi6LXqpo1cY/chvgtBSewpJsMKNHnJJLSVjXPv7sHSH
	lkH2b01ctxtPyRa6KvTTXx8ziuY7zcByL2lPpnkEL6DvX5YuQ/33OK5M
X-Gm-Gg: AZuq6aI+bjf87mGY+XmEl/Qlm5c1aYw1f5oqw2HRbqzxDJucosOl0Je2Uk67RKRLe74
	twUXu79gD5wdZL9C0U5o6NBpI73RQk9zlfKUGuBmmcdYAkpiKca/qRJF+GuzC+v7khC7FrEFNLl
	IJPwrkO2F4uaBZKNtVvkLTCfZPrbsT+7wa5cBw9l4+Ro9uLrUFQz6Vjp0Aym3a+qP3vmKgQ0ICx
	YcpllqhsLyx2WzyiH/IBykJhMHVayOj6/kUrFiGL9/Lo8hccgitCPvVm2HAbBNo/vzT1PmIHSDF
	YzD+Dxj12xcqK1H/tLanfYVP6bD970ihc+LsESCgFBMvZNoLWQWzqMeWFisc7HHUHh5TpSbS7PE
	8GAVbhoPW5rcLZq+a68OE1GHXcoQMEepoG8l+DqNBT1Lge/tOHktMNQdFhWgN3NgjK1FD86ZwTo
	lhIKQKSWNztRPhkpc/ENFtQe2ND72xAbGimBfNjAQ=
X-Received: by 2002:a05:600c:3113:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-480650f2933mr10392565e9.10.1769425412353;
        Mon, 26 Jan 2026 03:03:32 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85d146sm286254045e9.8.2026.01.26.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:03:31 -0800 (PST)
Message-ID: <69774a03.050a0220.3a3ac6.305f@mx.google.com>
X-Google-Original-Message-ID: <aXdKAHW0z2qC7s5e@Ansuel-XPS.>
Date: Mon, 26 Jan 2026 12:03:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Subject: Re: [PATCH wireless-next v2 2/2] wifi: mt76: mt7996: Add eMLSR
 support
References: <20260125-mac80211-emlsr-v2-0-466329d61c88@kernel.org>
 <20260125-mac80211-emlsr-v2-2-466329d61c88@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125-mac80211-emlsr-v2-2-466329d61c88@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030334_760126_B42DA146 
X-CRM114-Status: UNSURE (   8.74  )
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

On Sun, Jan 25, 2026 at 11:51:31AM +0100, Lorenzo Bianconi wrote:
> From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> 
> Implement set_eml_op_mode mac80211 callback in order to introduce eMLSR
> support.
> 
> Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Tested-by: Christian Marangi <ansuelsmth@gmail.com>

--

	Ansuel

