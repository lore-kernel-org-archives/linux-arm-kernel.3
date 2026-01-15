Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD779D41170
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=; b=OEeG3bImY/TE8mG1cPFpxNGKVv
	jCZAJg5sf/a/WeObQZEtiyccdFBQi1aLTf/FHdTMhqACguAFa4huq9Pd0VQHW30qK9UXn2sZjDmy0
	AuEV6zpZsgnc5b3gViTRj9harbWiMcpNG1PqwW7LV7Ktt86UwlBaPjcK7NlT43Pc7SWqT4JQ1xg6p
	n6Zsy0ptFBKyv0m+19yNPzgMs9uUtGHcvRWK5CgtMmrHAjacsyeeQxwYN4+6PKK57rBLj2r148FsR
	boL+ocPrpiSlkmKKGXJVSgq3lwTzj7a6/S2WI0UJYph5d9YajAAyPfv4Dt+iZqPosxPWqMEe3XXzN
	VwiMchUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLAt-0000000CBwn-12G4;
	Thu, 15 Jan 2026 11:05:59 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLAq-0000000CBvq-2spw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:05:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so674898f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768475155; x=1769079955; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
        b=Qw4arvJVLoeCqhOololrbO0XwQbt9yni9tW+SVo0N9+8kOj/mzb0VvXAMEQf442QLj
         mEBPl8JxDXSYGss2Rp7hHG6CcheE4T9yXdZTSa+HDPc1G2ZBnnYJBfseXKjfNX7pQiMD
         KuvN//NdJ2D1Hj6quatThqnYPm0hzw0CHRYx/yk9mDbk4U19V/c9A24NwRMed8irqffD
         1/cSLjdgkZO4ykYxt0guciZQO2uBEq1ia+RKOZzL4v/IAoXn7BIUpNlKJR5cjVmXrSg6
         CNZyrVExq0viUTBsN/6Gia6A3ZcFaPWNFKS6fVnzhcYmtJXTWIl3Zr/Ah97iMDeC9kFD
         VArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768475155; x=1769079955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
        b=hjI4WhZGYlSqZ6eroS64i/t7+hVlcnqpvrtEaHFkj8BaV6Ah1F6h9NS42rue97C9WD
         pjpLULY1LwANHTZ/u/GD5OAyW9ipWhMnV+Yas1YQv5ZcH2KltaUw//31Ya8pKzQcTfrr
         1AbjW/pnjK+vlESJXqG67KmOLBP6HtBjEJqLfJYXld6Ngvh7URSqQYslm+c73KlDjk4S
         zrUUf3/hqmInvED/QoIHmdCZUspJ5qJFnAhUw/QaQgNISA046CzpfoFZrLBGbJm2XAOb
         VWV/pvuRR2cXuCWAAUBAJvPrvSGtr6+6xB5WovdgefQc4U3et6alQ/XAFSkzqUVClvbe
         P12g==
X-Forwarded-Encrypted: i=1; AJvYcCVvb5noR4G3aBZE3uX2Z7ZIRHAx+DkTBAMFp2RXDJYtsm8N98lgibo6V/eraQ7aNn5xaKjXfzvS9JiCw+0D2J59@lists.infradead.org
X-Gm-Message-State: AOJu0YyktkY4JfgS3loNYP3dsvbPLU/LagAlsED/oRuHjfwUONrHRL40
	7I/Rjh5kUCvZxX/bOktGCMDY9T7xl7KKqT09CXN3MWuUaVoZjQfHv335BnfTqY3/FmI=
X-Gm-Gg: AY/fxX5p7+k4JhGgT2ObMriijjehTRpil9VjGihWxo067AjMCp34minUpzBcYNf3gjN
	ED9WavQ9FN5fYASfX8uhp13rCxNB4INpR+gU1sFuCMo0m5/uAUhWqeFJxb7gwsxaxs7RPBHX0eA
	b9ts5omcO2ZtZMssATvjMoPYar7EQehMi0qWvDa7B8RmiNTnacmJV4PTm+QaMBsoTbZs8N815FO
	MJgRvCi5IImxWtDslq0o/RLAlZNOuHuUae7+q7LfxRh1E9SU8nV7Ylfyka75Ioj2GvGR0NMfuuD
	3znFZTDVCjXb1EyPUgpuU3e0iKOM8Ktz6eusQsfCUdP2N1HY3zMgFPcePNbWpgctxuGBUQjM76C
	ORNAwsVbDxxoZTxwwEv0xvpGh6QhMzID3j+i61N6ozUcgK2/X9FhgtktWFdDFkwpdUF8eFj/PTe
	SxyPim6FW48V1asQ==
X-Received: by 2002:a05:6000:2f84:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-4342d3912bcmr7103110f8f.24.1768475154515;
        Thu, 15 Jan 2026 03:05:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d909fsm5297949f8f.31.2026.01.15.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:05:53 -0800 (PST)
Date: Thu, 15 Jan 2026 12:05:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 10/19] fs: pstore: platform: Migrate to
 register_console_force helper
Message-ID: <aWjKD4jv8CySV0Rj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_030557_312589_4C43BFDF 
X-CRM114-Status: GOOD (  18.90  )
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

On Sat 2025-12-27 09:16:17, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.

> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -418,10 +418,10 @@ static void pstore_register_console(void)
>  		sizeof(pstore_console.name));
>  	/*
>  	 * Always initialize flags here since prior unregister_console()
> -	 * calls may have changed settings (specifically CON_ENABLED).
> +	 * calls may have changed settings.
>  	 */
> -	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
> -	register_console(&pstore_console);
> +	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;

As the original comment suggests, this was done primary because
of CON_ENABLED flag. Otherwise, the console was not registered again.

register_console() might remove CON_PRINTBUFFER when there was
a boot console and the newly registered console will get associated
with /dev/console. But I consider this a corner case. Other console
drivers ignore this scenario.

I suggest to define the two flags statically in
struct console pstore_console definition as it is done by
other console drivers. Remove this explicit dynamic assigment.
And add the following into the commit message:

<proposal>
Define the remaining console flags statically in the structure definition
as it is done by other console drivers.

The flags were re-defined primary because of the CON_ENABLED flag.
Otherwise, the re-registration failed.

The CON_PRINTBUFFER might get cleared when a boot console was registered
and the pstrore console got associated with /dev/console. In this
case, the pstore console would not re-play the entire ring buffer
on re-registration. But it is a corner case. And it actually might
be a desired behavior.
</proposal>

Otherwise, the next generations of kernel developers might think that
the re-assigment was there because of CON_PRINTBUFFER flag.
And it might cause non-necessary headaches ;-)


> +	register_console_force(&pstore_console);
>  }
>  
>  static void pstore_unregister_console(void)

Best Regards,
Petr

