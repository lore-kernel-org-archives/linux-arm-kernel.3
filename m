Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 23:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEZrGANo2cEZWsDxSQlyGeYA6D2OMj2sQBUWO+CdYtI=; b=tljD0dcT4mEvMjzAfGPn9Hg3It
	zuQ1pnjZBMVbgqP4G3FEcBmEShCxn0mMAcKbfZ9ipxll4t8yG+hH9YZ+XDyENH8coPjKq96q21tNR
	EL/W0J6lBZybCVcUUn2vV2KP8myCOEoK/faWnX8wvasF5gvhNeIU6Xb7mBkLE6I5F1+ICkExLoyvD
	DtFWxPvROxMY0XGiRUJN9m2KI0Gv9msi90n9Gi+d4SAQHKDa5OjnBYgUqlbTay/dMyLAe2UsNoADX
	Tk2tah/9tGVQSL/lr99Q2A7XJQRDwe0O6fr+Y30V318lWQcTLubnsYyaxoTg/A8XBLckhCLnkvpGL
	btjAEJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgscp-0000000Dmu6-3m5U;
	Mon, 06 Jul 2026 23:21:19 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgscn-0000000DmtS-176W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 23:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1783380075;
 bh=OEZrGANo2cEZWsDxSQlyGeYA6D2OMj2sQBUWO+CdYtI=;
 b=BYbErYb0mJcGop6hON/c1ypQsc1YUviguOFUiG72nsQqWg/ILyLMbLblu0OF8yW5+SSBvKtRn
 Pkb4sWseMgEC9/cKJc/z7zopV0BA4IohN1NZxYEecLoqUQSKmJXZcQckpvPqzrvmZn4yeDKa9Mv
 zsISQP6zJSdNXUjgpUbn+/deA2Ht007vSOnyEFC/hEo9HgijenlEBeAxJFYCcrzaNnXkuSelM2i
 krxBLT8UUuzykMhuGZgKS84BHzEbSXfiPbFqhlxvetsMrU93IYNJ1QlasqOYvLyXBDU+p7b3AsB
 kJlU/moR4j7IC4PNZHV/Y9w/ZG/ZE6G+oheXQJ1wUOfQ==
X-Forward-Email-ID: 6a4c3867ebac8711c86b79d5
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.9.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 06 Jul 2026 19:21:09 -0400
Message-Id: <DJRVH1JI4C7F.3HZUQJ5YXD7BO@ubuntu.com>
Subject: Re: [PATCH] arch: arm64: add early_param idle=<wfi|yield|nop>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Yureka Lilian" <yureka@cyberchaos.dev>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <asahi@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
In-Reply-To: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_162117_656311_990176A9 
X-CRM114-Status: GOOD (  10.25  )
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

On Sun Jul 5, 2026 at 6:02 AM EDT, Yureka Lilian wrote:
> +
> +enum idle_mode idle =3D WFI;
> +
> +/* User can over-ride above with "idle=3D<wfi|yield|nop>" in cmdline */
> +static int __init setup_idle(char *s)
> +{
> +	if (!s)
> +		return -1;
> +	else if (!strcmp(s, "wfi"))
> +		idle =3D WFI;
> +	else if (!strcmp(s, "yield"))
> +		idle =3D YIELD;
> +	else if (!strcmp(s, "nop"))
> +		idle =3D NOP;
> +	else
> +		return -1;
> +
> +	return 0;
> +}
> +early_param("idle", setup_idle);
> +
>  /*
>   *	cpu_do_idle()
>   *
> @@ -26,8 +48,13 @@ void __cpuidle cpu_do_idle(void)
> =20
>  	arm_cpuidle_save_irq_context(&context);
> =20
> -	dsb(sy);
> -	wfi();
> +	if (likely(idle =3D=3D WFI)) {
> +		dsb(sy);
> +		wfi();
> +	} else if (idle =3D=3D YIELD) {
> +		dsb(sy);
> +		asm volatile("yield" ::: "memory");
> +	}
>

And otherwise...........?

I guess it would be NOP, so do nothing - is this expected behavior?

-Josh

