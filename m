Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3B3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2O/6xfFM31BvnbWJwW7ji3pCjMHZkaKAX9fc6k0Ej+s=; b=n6nawG8l+MmHeyJFyvphWEDWfj
	Zo1kLkBlydjTnAsv2lnuVlDH1WMi1HjKjxMLUhX8wlHBj7jUJHRQfLfTs16+FFhx2FwJrKdZkVHry
	DDAFfOgYLGq3S6ypr/O3+s5O98oKp189LaKYRXKwg+nrB/zA6UFfeTrj/3ssU7CrygZO3brB2xmZ9
	HC9sjMQ0exqBFqr9HNCYIBwJkNw/vI/NlSKfDwHlFMUgcc9NyYQMK5u//YJKwPHoQHlGvY68/Uiyg
	St/0TrvUocs1nmAPO+JGN2zmrCM2S/4dcovbiymCoC9iVSt4VFROKfHINLR1faxOv7Px5QY7slZ8j
	3/dGmLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNgG-0000000HWVe-3jdX;
	Fri, 07 Nov 2025 14:43:12 +0000
Received: from mx-relay36-hz1.antispameurope.com ([94.100.133.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNgC-0000000HWVD-0ZXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:43:11 +0000
ARC-Authentication-Results: i=1; mx-gate36-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2O/6xfFM31BvnbWJwW7ji3pCjMHZkaKAX9fc6k0Ej+s=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762526581;
 b=TwuO6CmhIGOBJqU8p+kyTAIu52/Ynz9A05w3vy/ot5Tfj1EEMVUmdWXoSPQa3ZRl5+mU3PIN
 VWfBtQYhQ7YKxE6nYL75k+DqR8CW/9dH5O9CyO9IJw1N32Kttgbo1yt4ksLpw2anq9BirA8oHP5
 fNyYJWYd4fyyIU3kMXACFszzfopM1rWhsWeeK/3fU/HMoBow3nVO1v3K2FRjdxZEjDzWY6kAo0L
 Gyim7dDbrUM1LIIXLOfAU79VF1nbyUk3PsbSczlPFjBBSEeMjUrybrXaqQb2wouRI0yFXp+vb3p
 9YRyr/lFCHgpzpPXT9qq9CnOf6M+b3WBseuQ+6i/X284A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762526581;
 b=TMat2DEcpDxfzS4ZD3quWh3pzVSSI6Zr347c52PTgNIPiGUewIkHmPJnoVqhqjI3t73SQyRQ
 /FCZmnNq6vok99fz6gG6lK77wehcysU1bnjakSgavJmPVMzp2JybK0szVvn585133JD/BIXAt+C
 O6rg+YLNYmZlgOuAdvBiCdUc2ppTEQNXl9sGlxNDkpdoB9Bq5xLS5rGm+bSz9ALKk0maZ9L2+ys
 ODCDz2NuSPbzU38Jfhhv86hYlf9CEXOZlxPTnlDKfBZuX6YtFlJGH6F32zRtUiTN8TYnb3jFnoG
 AFZb5m0EnLYKLcFl5m7jPc39JLJzduZq1Q6tDaLK5a/Cg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz1.antispameurope.com;
 Fri, 07 Nov 2025 15:43:00 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D4150220D2C;
	Fri,  7 Nov 2025 15:42:54 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] tools: use basename to identify file in gen-mach-types
Date: Fri, 07 Nov 2025 15:42:54 +0100
Message-ID: <13360982.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250826142518.2583999-1-alexander.stein@ew.tq-group.com>
References: <20250826142518.2583999-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz1.antispameurope.com with 4d31xq13lSz2HYtB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 2e0f76516db0893b2f62585e13d283ed
X-cloud-security: scantime:2.133
DKIM-Signature: a=rsa-sha256;
 bh=2O/6xfFM31BvnbWJwW7ji3pCjMHZkaKAX9fc6k0Ej+s=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762526580; v=1;
 b=gecPGI0FFArxx5PTwvWSLqlX3n3zQgqrSZ1/W7Os13CjuU8Efr2hWMNi4T1MWOD21fJH/VwL
 qQecer0qKGVcPKFd2fXFGpxyhtfeRwPvsGe/iOXLlVMS/ctM6KQXoJldpl8m9GOcZcNYcok8Q0/
 XZG8KkVxWlqfUWMrgQj00mzSmTBVa8kS0gkKTOPIuEGYdplK8YeS2MvRoAdv8kYltmfkicJYouF
 /jlK1wTkI8GogOeZ4Ibh5N/4mKL4F6JX1E9WVclXvPQ5ZCp/nYwlfSz3CRa0g4s/pTTXSCyd24J
 Li4rN0BwbBsKHvry5LKNj2tX8nrTudr3HgHnnSrPAWIUg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_064308_420828_27894F7B 
X-CRM114-Status: GOOD (  21.84  )
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

Hello,

Am Dienstag, 26. August 2025, 16:25:17 CET schrieb Alexander Stein:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> FILENAME is replaced by the full path to the executing script. If
> the script is executed via a fully specified path, that is captured
> in the output. Although it doesn't impact the output, it does trigger
> reproducibility warnings/errors.
>=20
> So we introduce a basename() function in the script and use it to
> make sure the output file contains only the name of the awk script.
> The motivation for this change is Yocto emitting a build warning
>   WARNING: linux-tq-6.12.41+git-r0 do_package_qa: QA Issue: File /usr/src=
/debug/linux-tq/6.12.41+git/arch/arm/include/generated/asm/mach-types.h in =
package linux-tq-src contains reference to TMPDIR [buildpaths]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any feedback on this?

Thanks and best regards,
Alexander

> ---
>  arch/arm/tools/gen-mach-types | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
> index cbe1c33bb8710..ab69d408f9e12 100644
> --- a/arch/arm/tools/gen-mach-types
> +++ b/arch/arm/tools/gen-mach-types
> @@ -21,10 +21,14 @@ NF =3D=3D 3 {
>  	  num[nr] =3D ""; nr++
>  	}
> =20
> +	function basename(file) {
> +	   sub(".*/", "", file)
> +	   return file
> +	}
> =20
>  END	{
>  	  printf("/*\n");
> -	  printf(" * This was automagically generated from %s!\n", FILENAME);
> +	  printf(" * This was automagically generated from %s!\n", basename(FIL=
ENAME));
>  	  printf(" * Do NOT edit\n");
>  	  printf(" */\n\n");
>  	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



