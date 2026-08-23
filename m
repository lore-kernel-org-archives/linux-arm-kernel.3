Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D4BC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcOyNHWPz7ng4uDzBlXxrpitR6L8eYl60PHRY+S3DYM=; b=TPi4PJ6dtL9JBvZChToFmdHQZ7
	148DrC84avwFD2OnE99mS5WJwy04UGThQ5iQRf8LFYWNFiU5f3MwuDYsGr6Y6dNwMqONJvvRWKhCX
	A1j/KD1Lqzq5Pxt4iFzPKpGEH35aPTh4MkKpoKn6Yq4XsoRnekETm3dtQ5MX9iXVKJcj5QD28huie
	Sc5bbfMTWrTgUHGRa9C38IjZ4xi/FqEpbe6o7h+Over9/UMv+7LOlI9zqEDvQ0Fg38uIgu/sfJA9q
	gC+ap3xnP8cJIWt4431Mvh+GbCkQ9pgYKd1MCesy65vrsferL8nxEHgDUGDxizrqP+j6mU1J7rlb7
	Ai1TZnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7QU-0000000FLoW-3RpT;
	Sun, 23 Aug 2026 12:35:50 +0000
Received: from relay.yourmailgateway.de ([185.244.194.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7QR-0000000FLmv-0AK9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 12:35:48 +0000
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hSYRc22r8z9B7n;
	Sun, 23 Aug 2026 14:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787488540;
	bh=QcOyNHWPz7ng4uDzBlXxrpitR6L8eYl60PHRY+S3DYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=etJPKPk+m8wvTiIOCazzOgcsEG3x1/N/wsI1leC42TvEeF110m95m4micdC3JaG9r
	 69w2uDvmhon7IbsimItHYC40PNdDxLCF8xfBsU/L2+m11XJR8nxVGOWjVX6wPKHhDQ
	 qOqjF/+PqYm558oTIsK/fECHYHUZtRr5LlZlPMGKHbK0d5vimI/EI0le/1H48djrwN
	 n7hghb507g9w0zalNwuW8hQFSoKZyjccVO8YjgzCVlsFCvr/DlGQJhU4wdXdtNVNpb
	 AKqIvEabzff8FQaKk06A9zqvuORA2tDwXRQJQ5BZFSMHr6fEi74t7CtOlKTpv4rHcm
	 r56YuaN/vgGRA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hSYRc1LnHz7x9l;
	Sun, 23 Aug 2026 14:35:40 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hSYRY4TRMz8svk;
	Sun, 23 Aug 2026 14:35:36 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 080F65FA13;
	Sun, 23 Aug 2026 14:35:32 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <092cc12c-0b64-4352-89ad-7afc824552b1@leemhuis.info>
Date: Sun, 23 Aug 2026 14:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Restore get_cycles() return value
To: Ryan Chen <ryan_chen@aspeedtech.com>, Thomas Gleixner <tglx@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260820-b4-arm-get-cycles-v1-1-33d0ee0cf141@aspeedtech.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260820-b4-arm-get-cycles-v1-1-33d0ee0cf141@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178748853244.3065954.16034214713717909973@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 080F65FA13
X-NC-CID: /Zpw8zn8NKrQBsqtOJqOe30EKBgSJx/EAwkCHhrgsg3rzeFGsm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_053547_427622_12061E39 
X-CRM114-Status: UNSURE (   5.81  )
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

On 8/20/26 11:10, Ryan Chen wrote:
> read_current_timer() returned 0 on success, so the get_cycles() ternary
> yielded the cycle count on success and 0 on failure. delay_read_timer()
> returns true on success, but the ternary was left alone, so get_cycles()
> now yields 0 on success and an uninitialised variable on failure.

For the record and those that haven't seen this yet: this afaics was
discussed earlier already and fixed upstream by e1e3a0ab69c64e ("ARM:
Fix get_cycles() after delay_read_timer() conversion").

Ciao, Thorsten

