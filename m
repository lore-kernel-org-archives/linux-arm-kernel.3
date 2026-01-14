Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5A3D31A29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=; b=DNcoa7c2WUKOPYJXSLwxkNcH7U
	ob6shTdHKYIGr06V3PMQ79J7i3p/LqMdT3aBV6/fDyZ5DNDSa5KEu4UNDA1D4wUQOCgPNanGBm6+H
	b4swUYG/k7UXgsKIL06MOWZJiteW7jfju2Uv+n2Ta908sxWZ/EEtx1SBeO43K3uuGSxaqgUylCdtX
	Wgbk5ejNOQhFnVUuoThBl9MdHdCZL6Zj0aiFR9sT/7BR3Evt9LcSlVXs0UN4EO/al1A6BDKbUXbXl
	Sbcy9+v7MNOVjf4DgzVIHVHRDKZh1u2b0ueftm9ttWrIKwkf1lnWwboFGQq+SfkyZT0bHVezmSetN
	oAe9mOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwUI-00000008OC5-37SU;
	Wed, 14 Jan 2026 08:44:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwUC-00000008OB5-3ZBm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:44:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-432d256c2e6so4679592f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768380255; x=1768985055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
        b=G7YD9GT9MNwkv7GZp7I46HAKE/2DaWiOGkuFcp7CIEWkCHExzYkeWGJ+/neNbppQsn
         P6/D4UFb0SZalcxfQLR7SKbCf0gq6ZJo8Az6skkP0C49bGV1SPVcambmHhDfdJw295my
         ebabyiZtdDCN6CjQqmXAtP28KFXa4ZCyAzkqNuu8nxEozbre8l4k3+tG5s0DZEbzOUuy
         5HgbJVhEmSODoEblLggTtQd96UGVnNXFy3cutrr/jCbtulNCbRFWrc2PFNwgSBW0+nsf
         59CmNk8DowXdIgMrIAbdrTsbLxVPZcNbupF9k2kTi1qWTtczet7b8uud31TzBp4zDCwG
         HxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380255; x=1768985055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
        b=h+nA1H3YD9cZrE0FAU8nwDI8SmYSs6rldN4cuCjvNr67mxUdc1/sp0YSQ3/dvZEmUb
         /Kzq9gMntFdVTmiUk+opdS49ASXH6g6ozGqSz09FOXu0BPOUy2VvU6mwTx7druTcN5no
         T/DjaDAu/o+lIQcIcYcK+CJlkx8B0iBUr+wxMy1H7vG3NxlhFRk7gTzvSmol28WYDxcT
         /O9N2FBEnW9AjXwt+lkY2pLFjH1Rr7umFvtLAa00IBzSXA5SGEt6fHAcpXRuNMD3cZ96
         ptGyFeOX0Guv0h95+lb7k2Ho+mIMre02DwuakFbInYhRUJSR30/ikLBw5mD4tgfKnix9
         Zjyw==
X-Forwarded-Encrypted: i=1; AJvYcCX6MIge1EkVPCDG0k56GaMcIpTGsASrLJDP0zNsFk5O8xfi6hFbpcaTJdUGfkjJM//yqO5s0DpA9ItmMJ9RHtjF@lists.infradead.org
X-Gm-Message-State: AOJu0YwVeWq1cxIOAIot0m3DM2zrSnNtFO5e+P93Ujfe2ALnjIG8v8dG
	xPJxydUi9blsaH8s9y3Vm9b4FF+F1XnUvPD2vxsZK8R/8tDrTPPaj8fgUshkXVbOb/8=
X-Gm-Gg: AY/fxX5iBwNCUx4vfeCk1ncASMi5RBweXCopewd0ptkMW1ACT6n9KV9n0oT3/gDyTpx
	D/5Xz67cJ+9MmPGjuOxZTlU0pwgyeYMV7zLEOZ11gfaRxAB+AD/2jx/WlYAm2/VJdn5MMEfISct
	8bwwzyOOnlCKTY+jCTm0n6ySzjhWpIp+zctZETWYD9FjmkMh9JEkTHd8edjHvdmnPuR9xpTOLIF
	BDD3bkKH0niA2e/zikQm97DUytebP2Zezu0IKhvW9dVRk136tQbueiU3xk3DLE5U834xo3dSmpt
	VDCez5mefy9gQ8GhPAOrWjsspS6O7mrW829yR6b9ntUAZ0YDeQXE7zsqNf7O8THDOzBR2OkYtnX
	4NnnhsE3y17oP/6PYorWYD/HTq6wBe7mpna5pZ4Pwus0JeJiGsjFlMW8sU4ze8oVk9F7pa0gEIF
	dUqEZhLrUJcs3NTA==
X-Received: by 2002:a05:6000:61e:b0:431:a38:c2f7 with SMTP id ffacd0b85a97d-4342c574bedmr1500621f8f.59.1768380254886;
        Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm48685590f8f.35.2026.01.14.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Date: Wed, 14 Jan 2026 09:44:11 +0100
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
Subject: Re: [PATCH 03/19] printk: Drop flags argument from console_is_usable
Message-ID: <aWdXW6ohfQ7_z2B_@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_004416_942359_D12A783B 
X-CRM114-Status: GOOD (  21.98  )
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

On Sat 2025-12-27 09:16:10, Marcos Paulo de Souza wrote:
> The flags argument was also used to check if CON_NBCON was set, but their
> usage was fixed in the last commit. All current users are reading the
> variable just to call console_is_usable.
> 
> By calling console_srcu_read_flags inside console_is_usable makes the
> code cleaner and removes one argument from the function.
> 
> Along with it, create a variant called __console_is_usable that can be
> used under console_list_lock(), like unregister_console_locked.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -656,13 +656,8 @@ extern bool nbcon_kdb_try_acquire(struct console *con,
>  				  struct nbcon_write_context *wctxt);
>  extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags,
> +/* Variant of console_is_usable() when the console_list_lock is held. */

Nit: The comment is a bit misleading because this function is called
     also from console_is_usable() under console_srcu_read_lock().

     I would say something like:

/*
 * The caller must ensure that @con can't disappear either by taking
 * console_list_lock() or console_srcu_read_lock(). See also
 * console_is_usable().
 */
> +static inline bool __console_is_usable(struct console *con, short flags,
>  				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
> @@ -707,6 +702,18 @@ static inline bool console_is_usable(struct console *con, short flags,
>  	return true;
>  }
>  
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.

And I would add here something like:

 *
 * Context: Must be called under console_srcu_read_lock().

> + */
> +static inline bool console_is_usable(struct console *con,
> +				     enum nbcon_write_cb nwc)
> +{
> +	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }

Otherwise, it looks good. It is a nice clean up.

Best Regards,
Petr

