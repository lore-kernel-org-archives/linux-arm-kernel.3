Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DD5D5E147
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FlmFMFG8z9tp2PIyRR+od1etRA+qYa6YsLRDcg0vsI=; b=ScudADCL8DB/gmRjSLiqVYbsoh
	KsbehG7WO6Qnkho4UMUiZnIdFkZ41YH1gF4zfwv5evDlwIbwHLfE86MtBa/NNmPuzNMMvwiVDtieP
	fODnwQdFROJ1pVhxORBIf8fUGZ7edKrC8j/no4yTD0fKPjknaHcE8KNj9Cjqz8wPnJ5Q2rc4YsUtq
	C8S0woG0qZo8XTUUW8x6pUlHg8L43G4dyIsW28P1Qe2jDgtymW1OG3D0jDgsHKmrt/RYxBHUJa2q+
	p5qd7MIoZlmmDR2tUbfh+TxLD2q+BDEkXrweb10xQ+DL9+z6PdkVa5lFoR5tWDqx5lXeVgIuywI4s
	7lBYAU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUfc-00000005Dj8-3ZPS;
	Tue, 16 Dec 2025 13:00:55 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUfZ-00000005DiQ-3ddd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:00:51 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 600455BCD2;
	Tue, 16 Dec 2025 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765890045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FlmFMFG8z9tp2PIyRR+od1etRA+qYa6YsLRDcg0vsI=;
	b=WcKTp9jV6ypdwb1YpmuArdGB0TdBpfTQi4MQvOUd8SbW6lxJlH5fLa9xd6dCLsUSzvqvKi
	Wfub2UVDi/6Ii1Rcx4IWSJXWtOzys6irCD9kXoJA5wS1t9SDLihV/N/niQGU3c50SelzKf
	iz/M8OlHe3R5bXMAdcX1DpU+3IIbFg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765890045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FlmFMFG8z9tp2PIyRR+od1etRA+qYa6YsLRDcg0vsI=;
	b=MKf5qMCKH7Gp8rBI7KmgriIAJ2Z/eGoKy/r7hez2/+QkcMQl/WqIVQ95WoUzlz7uQRc04J
	bpTOAMdld7UQd7Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=khe3Lupb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uuBBJWHw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765890044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FlmFMFG8z9tp2PIyRR+od1etRA+qYa6YsLRDcg0vsI=;
	b=khe3LupbGRUn3uWTIMA1i0VYHLXhJ1GZf3alY6iBbXAzAZVUECVnewm7fWudpWf9okIp1u
	u+P28qFVQzPQ/sE5yaZ6QVzDYLpD3BA0UrIh8ax2aPRRPUsxoVv0bxbYmCowRsQk8VVlnn
	5pkiN9UKASgLZix+nX2+AVo1pGrnPB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765890044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FlmFMFG8z9tp2PIyRR+od1etRA+qYa6YsLRDcg0vsI=;
	b=uuBBJWHwLtlLveYFSpnrriSUi2Klz7bqzA4FfbRxYWkeWLnBts2MXO28uEoKl2RYEtPaGC
	yRdqK4wVapxQTKCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E4AC3EA63;
	Tue, 16 Dec 2025 13:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id twmoGPtXQWnLeQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 16 Dec 2025 13:00:43 +0000
Message-ID: <189702e0-e6f0-44c5-bed6-eef058d90b76@suse.de>
Date: Tue, 16 Dec 2025 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: broadcom: bcm2712: Add watchdog DT
 node
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20251031183309.1163384-1-svarbanov@suse.de>
 <20251031183309.1163384-5-svarbanov@suse.de>
 <20251105165553.3910996-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20251105165553.3910996-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 600455BCD2
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,broadcom.com,linaro.org,gmx.net,suse.com,raspberrypi.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_050050_057478_04987119 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi Florian,

On 11/5/25 6:55 PM, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> On Fri, 31 Oct 2025 20:33:09 +0200, Stanimir Varbanov <svarbanov@suse.de> wrote:
>> Add watchdog device-tree node for bcm2712 SoC.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>> ---
> 
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!

For some reason this is not part of v6.19-rc1.

~Stan

