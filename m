Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE7FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=; b=P0Etatp7ULzjn7ntUV8POP+2FP
	RsnopTbfS5PceMdTkhiXaKZdn/kLrT+sdrj46hoA4JmSRGe8cB3DvXwNs2Te3xM/0o5VIjJO6RHjM
	rrqUcKrKqZyCSn9RO1vas3JLEnVDhtZRVdUski3nmHY6kQ1sqPB1ImUP9WKYwtqtz47Bcbn6zC5KQ
	kKl7XGyTCZwRS2+lbloMn2t97KXVx4vNvk0LOkH8uED5MpH62zF+4WuXV/CyNVeSiXNyia3na2Z/o
	4l6H98TFtLJ7JP+/QVa0hQROzT/i7cnyrMAeyAMOvHttz9YZjD+Yf7+NVA4qdmK36dQjDifulNrn9
	S8zbbTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASUi-0000000FKGc-0BHu;
	Thu, 01 May 2025 11:54:24 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASGp-0000000FImk-2Kco
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:40:04 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8D4721210;
	Thu,  1 May 2025 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746099600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=zBus/T3ALWG5rtaYrS6Uk9o0UsMsDPX2OiAfa7Y6rX4+gRWiAUTmy3D5FxrtXKsM4XU83K
	5Rg11xc+OlAu0f1VrQU90rLYylENxKPYFj6ClVyClC5RXnZWuUebW9MMN9PFEkVm9kR9kA
	7Wxm06W3GxLuuefnFsOp6+l1DZbNtf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746099600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=WWgZTIUqALdcq/jtUHrtsc/c1G2FICT2Qm0z9CbtNTfj0/YuLKJW0ZbNhaBoi9q2CmvMP8
	aaD+MFR9WWg8iaAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aeTvuNR5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ebFqSTjv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746099599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=aeTvuNR59XPjzTWCsqNU2rXg4tHYYc+3K4IGxu0uQR1/8USiFrjWnxVuyb6MYni4U/ZUIo
	NqjE96ZhaJEGjtmW4UPdM8NY02w9ButwSZ69Eke4RvhQ1D8gcfVq7Q8OUGnj/Etua4i6iu
	LTrtxzBocQMhPHCrNJviHXSLENL2B7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746099599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZMwpw29R+5bRJxtHJU340o40TdbMjMQX6rZrnPy7QE=;
	b=ebFqSTjvIgFzkTrmaMyR+CVK6Lc+D3eLyhcncIpq6qrYcu3/Bv9md3DwvItpCwid/VZh4F
	GKfsmjq8YdMRo6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76BE5139E7;
	Thu,  1 May 2025 11:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2rZ+Go9dE2jiNAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 01 May 2025 11:39:59 +0000
Message-ID: <82a39d6d-ee7c-4ff2-af87-efda939e5568@suse.de>
Date: Thu, 1 May 2025 14:39:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/irq-bcm2712-mip: Add ARCH_BCM2835 arch option
To: Peter Robinson <pbrobinson@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanimir Varbanov <svarbanov@suse.de>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250416082523.179507-1-pbrobinson@gmail.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250416082523.179507-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C8D4721210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com,linutronix.de,suse.de,kernel.org,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044003_750055_573D075F 
X-CRM114-Status: GOOD (  18.45  )
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

Hi Peter,

On 4/16/25 11:25 AM, Peter Robinson wrote:
> The ARCH_BCM2835 is used widely for platforms enabling
> the Raspberry Pi and some drivers that make use of this
> driver are enabled using this or the BRCMSTB option so
> add this too so the users that want RPi5 without all the
> other STB devices end up with the driver as well.
> 
> Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/irqchip/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stanimir Varbanov <svarbanov@suse.de>

> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index cec05e443083..08bb3b031f23 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -114,8 +114,8 @@ config I8259
>  
>  config BCM2712_MIP
>  	tristate "Broadcom BCM2712 MSI-X Interrupt Peripheral support"
> -	depends on ARCH_BRCMSTB || COMPILE_TEST
> -	default m if ARCH_BRCMSTB
> +	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
> +	default m if ARCH_BRCMSTB || ARCH_BCM2835
>  	depends on ARM_GIC
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN_HIERARCHY


