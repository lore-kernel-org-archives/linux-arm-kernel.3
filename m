Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B860DC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJXNLBrjGs3w38rvWKID3ZJzYdlQSoHtFbkc9JdtFMI=; b=IwQnVTuk5qSJPmUYlZ2h50OmyQ
	uuY++7C0YE703V7zXkydOxL82jtRN05PtVcaui6qdxX6XveQ81rLVn6FpjboNyzWdB6iYlF6r0I8W
	LJaRi6aD3Tr2THPW0t6tvHvJEk8FoPgbIZg6apU3vVfX5oTve+YjyuF0VOolF6CM+OIcT5XBJweLp
	Xzexn3UEAX+tQhvewu43cFNaWmgYqmGW6PNCz+Pryd/t2KEgAgcEBd5aFbmAerQQNM1Ks21347wUN
	ACimVFQjKoxVGdl+i2e/7rBVDAgNNo0zHR9rMKgTYcBtyuS1tZRuZ1pIxiyej78/zzYMMYtqfNt5R
	LCbOqAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBki-00000009hA3-3d2u;
	Tue, 21 Jul 2026 14:47:24 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBkg-00000009h9B-10Mg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:47:23 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2CB87A589;
	Tue, 21 Jul 2026 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784645240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXNLBrjGs3w38rvWKID3ZJzYdlQSoHtFbkc9JdtFMI=;
	b=P8FRlMlDac5iN22KQqA/gavT+JbhpBqhQRp/fiNb921FHISnzkc7ocyWMA82Xgfq90Gvt3
	9ePDs3LjNaISHrzN5oOzauKviKgpmImMcgVmITSBUfvP/CUG/Yb5ILSc94I+Gp3oQCGYay
	VuJOSZ6ec1zYhTGxp0bM7HhB9hxsKCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784645240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXNLBrjGs3w38rvWKID3ZJzYdlQSoHtFbkc9JdtFMI=;
	b=UrXAtgZVmS9EpvpRitLYluILvnZsfeD8WQdwKi08F8EwWf+bVbstDxlPEZpGGJByCJJS0I
	LXe7gyuO/E1CSvCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PbLahHS+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2Pta8MOd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784645239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXNLBrjGs3w38rvWKID3ZJzYdlQSoHtFbkc9JdtFMI=;
	b=PbLahHS+JIO8FFxa55ftRMTbrK2zhuzVmvk2UH67pEtKqxkcvAv4TbTUAmSWPw5reD0tY4
	EvHbED2SgCee7lqkkmO+VB9ZQKYZHJz2NGZrnAIG6HPJf1ZySKRnrLX6WNJ1KVa++pT4aJ
	YXQ2nnEHK3l8kbsag/P9Zrq5p8MSOdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784645239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJXNLBrjGs3w38rvWKID3ZJzYdlQSoHtFbkc9JdtFMI=;
	b=2Pta8MOdCouLA0Pp3RERt7gVtSf83LKuwPyE1sdqbU3dckLmpZLUD9cjGoEotS8j8PMIIb
	MBOik6gSdB2p+hAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BB28779AA;
	Tue, 21 Jul 2026 14:47:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +0XiB3eGX2pEWgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Tue, 21 Jul 2026 14:47:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next] ipv6: initialize ipcm6_cookie before parsing
 control messages
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Wayen Yan <win847@gmail.com>, netdev@vger.kernel.org, 
 lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, 
 edumazet@google.com, andrew+netdev@lunn.ch, 
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <178464510579.7763.6518393222506443032.b4-review@b4>
References: <178358611790.128118.11036367713019213946@gmail.com>
 <178464510579.7763.6518393222506443032.b4-review@b4>
Date: Tue, 21 Jul 2026 16:47:13 +0200
Message-Id: <178464523384.7942.1381538265158230893.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,redhat.com,google.com,lunn.ch,collabora.com,lists.infradead.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	TAGGED_RCPT(0.00)[netdev];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D2CB87A589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_074722_435755_F00181BF 
X-CRM114-Status: GOOD (  12.52  )
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

On 2026-07-21 16:45 +0200, Fernando Fernandez Mancera wrote:
> On Thu, 09 Jul 2026 16:32:30 +0800, Wayen Yan <win847@gmail.com> wrote:
> > ip6_datagram_send_ctl() parses both SOL_IPV6 and SOL_SOCKET control
> > messages. For SOL_SOCKET messages it passes ipc6->sockc to
> > __sock_cmsg_send(), which updates fields such as tsflags with
> > read-modify-write operations.
> > 
> > The IPV6_2292PKTOPTIONS and flowlabel option paths only set ipc6.opt
> > before calling ip6_datagram_send_ctl(). If a SOL_SOCKET control message
> > such as SO_TIMESTAMPING_* or SCM_TS_OPT_ID is present, this can read
> > uninitialized sockc state.
> > 
> > Initialize the ipcm6_cookie with ipcm6_init_sk(), as the normal IPv6
> > sendmsg paths do, before overriding ->opt with the temporary option
> > buffer.
> > 
> > Signed-off-by: Wayen Yan <win847@gmail.com>
> >
> 
> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> 
> Thanks!

Now that I think about it, shouldn't this go to net tree with a proper
fixes tag?



