Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3751DC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4a8kETbbno+r0apC2sHIp95ZZ7jnRlfEcHkEbZMrCc=; b=Vgv33womIF16kpgFKa8iwJ27vZ
	LzW74cIkzq1HnCB9iqQaJT7jLrbbWx8qbELTt7vpRCtjmQEQEAIVLotAirDr+Jxlq627yBKM+jl5j
	qAL3leOIVHFZMgukfqWLUjz/5FO1WeslSpMk6tOlPXstOnHKMMevJzIi6td+O69zqYbHpBy8AQPeN
	FtLKUe1gZ5Bk3TAwxf4N06YBcskuxpDz7mXLstNkb9VDgZWG/rCIuzVzDRhy6mtSNSCMaWx3z9RCd
	FQuTT7RMibz/5SmrCdBlVFfzjiIKDRbAMdSeGaR9NWuFmtja3McX7Yv3N+OR0E38GDCbOFjY52Fg9
	E+MvkFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lMC-00000003pRO-2bpV;
	Sat, 05 Sep 2026 08:02:36 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lMA-00000003pQr-22QV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:02:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1478927a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595353; x=1789200153; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k4a8kETbbno+r0apC2sHIp95ZZ7jnRlfEcHkEbZMrCc=;
        b=iBOJXHm6MuqTBF9O7Jp8b0Zqk2HdIT136H/zU+NitS195obv273dl/zGNoZj2C+69Y
         48KinvC4pzFxj7PXU8RK4ZPNy54SfFLbQDyHguQ3r+VfJ2sCGMH0QmKReqUgf+opsYJV
         mltws3GQIiEGJKE7mgvQaeQNyOgWez4f16499uBNXyyP/3fDbN0w79W46GnnLU3nb/u6
         wuCthZE8UZzkBfo19PXDzMmgj8vQMUrD/VJDNn0keqJvmZz0EWdIjdn1TyU5sYhSY9BT
         nvpvRWO7k74hYiuq1BQWsFkU1SwR3kEWR3ohSvNC4YozjcE945Ea+4Kb1sOfjx+9Pbhr
         /nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595353; x=1789200153;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4a8kETbbno+r0apC2sHIp95ZZ7jnRlfEcHkEbZMrCc=;
        b=Ao4ZoxuDRTA5ugYuINIVrz/qtuFZA1he2uy8t7m0U+S028jkBdM91k4Dq35TCNsS8O
         vPHbDjKViTiUQTKCn4jv08EMFQwvdHzSO6KcNaqrx1EGFzowd7bCu0/iLPHFNWsKQVFG
         fszLMHc6O6luxqfK+fw0p6rU86SqHJnBd73PQAFwmzNVmT4m/rCZF2Xf4shiCfnU60Dl
         K4MVHkWi6j+tkREAIHriDFsURafO8x5KogYvBgId+mgepEdehE9YwmEaVTHw5i7eInL7
         MhqLE88E9imSye2sFYOzgtRmz16Ahs+/7/slwWveZrnSB324y8lJvMwN6ZP1RZFzImO7
         xkxA==
X-Forwarded-Encrypted: i=1; AKwUvBz7ThXAvy8RHZzEXGxGQrPE/7EtL0AUFxPXFUh5BQsPuu7TAkUglchMuMz9OVe4fyr0fvwsK2xSeYTYnV3h22Y9@lists.infradead.org
X-Gm-Message-State: AFuF++lj5OimA+FJD37U55El2rzyeM+qTU+34xUNpUiIw4jluOIknSHb
	hP6pq0hGE05fVitet5b/mfAD+FXOtNRPAkzRk2Qw0zchscbHZD3ygUZe
X-Gm-Gg: AYBFou1EuBZlYz3ksO5G0bwz28kgVI5J+01k8FaBiMNrmHrHas8ToyHS1zrGpvkyMg8
	ozciUS/zrDJT6KQX2AO7a7B60a8Z0CgUntzKwnCjZDQRKRDD4J99DyDdod7tdrLerRLlrAcfofp
	Gk+VkxwnNvsQ+X/xZfmLTlHCJACbaLP/hvL4c4MmMb2s11eaIFWDEKMzpFVcF03/VqKEyOl5jdl
	WNwCazMs1Cud77Um7ygtOm0H9l5tH3L9xKu3vFdaJyjLMIBbqHALXFUjCMObkNemS9Pw1mrkL+v
	8XcLwFGt2lD/SDeY0SF4WycqZh0kpy4gUBxf1y/hBLKlPMf3UD5AZ70LdT5qtwP3UmSooEIeRuW
	snus4ntqQ60xIUmUHz4jdFPEOmShvZ5nyyN52ZGs/1Z/qn+CvXITk0PoKX0LfRWlZ2vD7AixSyd
	oeISKwa5LNigomvIE9HwhXdf+odtCm90Bb2NWE+Tftv7+yRAQAnzUJYuuPFRsqH1/FI3gDutdw8
	zcOI3OSYI5vR3B8shM=
X-Received: by 2002:a17:90b:5246:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39b262a3cf7mr18232824a91.24.1788595352899;
        Sat, 05 Sep 2026 01:02:32 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm15543669a91.12.2026.09.05.01.02.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 01:02:32 -0700 (PDT)
Subject: Re: [PATCH 1/9] docs: kernel-parameters: Drop the atarimouse= entry
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
 <20260905070347.25902-2-kmehltretter@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <762382f0-87cd-2148-9846-40448c7b1702@gmail.com>
Date: Sat, 5 Sep 2026 20:02:11 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20260905070347.25902-2-kmehltretter@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_010234_580860_C2683250 
X-CRM114-Status: GOOD (  18.61  )
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

Hi Karl,

Am 05.09.2026 um 19:03 schrieb Karl Mehltretter:
> Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
> only takes a module parameter, and git log -S finds no __setup() for the
> boot parameter anywhere in the git history, so the entry has been stale
> since before it.
>
> Drop the entry.
>
> Found by cross-checking every documented name against the __setup(),
> early_param() and core_param() registrations in the tree.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd2..c8d96de4c00d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -591,8 +591,6 @@ Kernel parameters
>
>  	ataflop=	[HW,M68k]
>
> -	atarimouse=	[HW,MOUSE] Atari Mouse
> -
>  	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
>  			EzKey and similar keyboards
>
>

The code parsing this boot parameter disappeared in the conversion to 
input drivers sometime between 2.4.33 and 2.6.18 (my fault entirely).

No one appears to have missed it all these years... thanks for taking 
care of this!

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>


