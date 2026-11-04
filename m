Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72EB606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JifVy6yW;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=FYoE7iVK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XmyXgWF7QGVn7kMdXBMEOTW0Dzq4f3Xq1XeGtBa4Q20=; b=JifVy6yWLE/ok5
	HPQ94gmwMuT5gyY0wDoEHmvKSKd58YQ6hrGCbQBo6wXuZvp4Fahwsg/KNSEBsTT8rJ9NR6vTSZmCh
	QJwIqAdSgxyYPp8urVpDxMO6aBJbeXoK07GC7MGZdnyn8Cw6Uo+74+I1wmNHb78pLGWCtj5at+1Uo
	kX9AGih3X+OMseBsVR8nF5rVPQkTNWOv32yIry+ZzMcOhYhUcDJPNNoweYi6RQy1YrYbKzetmM3Aj
	2/N7IPN8gE6SVt27/Cgkmf9VzmTrg6fVV8DW31DPkzM/Y8ll3P1FKBvgZuotQncKlM3X8dsaIWf6N
	HiCVLQD/8DbQvKvBBLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdCS-00000005pkG-2Q4o;
	Wed, 04 Nov 2026 15:46:56 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdCP-00000005pjr-2o92
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:46:55 +0000
Date: Wed, 4 Nov 2026 16:46:47 +0100
X-Lima-ML-UUID: 76cb299a-8bea-43ab-8a8c-bd6afd96e001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793807210;
	bh=oZxpZr1GoCPpk0hXpo/a8rT6fD1pImgCa+1ksU/JwLI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FYoE7iVKLYEo/4MWGfSPFwlmBPQOEcY8PnQKfDWwtaXJ06vCJeIU1fhx86lHexT3w
	 OZqfosqFGDhw8Czwy5dzRVtnsIxx2IrlHIg4EDCVkRBtQDANj1HD8O3mQYPzdRdiPK
	 I1W38LD+vtxMBJiyE8HtAGSEwcKqh+RiQmHfNs9xPpTidski47v9sSCVKtGzn2N+pL
	 JIyl/ZiUKmW3ZYKseOV21oF6b/F0dbb355q8HKyRuXKhVW0vpJ80dqZZkLHR3lvnva
	 tYQ1Z1MQ44QC537e+jPlhj128ubzkM8pFFZGspcoBNKOSmuG33/2/msqKyiN9eHdsf
	 y4zltVd568QlA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 66ton99@gmail.com,
 josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, Yossef Osman
 <Yossef.Osman@proton.me>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE
 advertising report types
Message-ID: <20261104164647.5e9351cb@kait2en-mbp15-1>
In-Reply-To: <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
References: <20261104151601.70493-1-dev@deq.rocks>
	<20261104151601.70493-3-dev@deq.rocks>
	<CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_074654_136081_32D7CE9D 
X-CRM114-Status: GOOD (  11.53  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 10:24:47 -0500
Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:

> I don't think I agree with this being cleaner then doing at
> hci_event.though; not only is it more code but it also walks the
> packet which is inefficient and may have security implications as
> well.

You are right, the driver should not parse the event a second time.

What I would like to keep is limiting the mask to the controllers that
set these bits, as hci_bcm4377 already does with
HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY:

- add HCI_QUIRK_FIXUP_LE_ADV_REPORT_TYPE
- set it in hci_bcm on Apple machines and in hci_bcm4377
- test the quirk in hci_le_adv_report_evt() instead of the
  manufacturer, keeping the mask from 88397423671f

That drops patch 2 and replaces the revert in patch 3. Would that work
for you? Then I would send a v2 along these lines, with patch 1 and 4
unchanged.

Thanks,
Andre

