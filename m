Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C2FC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 19:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vZGi+iuh+YDljvOzn1g8dcCjbMnjc8Erlh5ur5ioA8=; b=UUZFTW+s4S9NkANr5MBExct/lJ
	dSRO8ANttFdSihcCLV2T7QS/Hxp5BHIglEBwQhaTHs3d1OWCvyBzh791locZaidAp2YBTB/+TDZv5
	VLw44RxHGwMZaL95fNZPy3UzSstXndEjQncl285w/QD106FtnrDX+yi3w/+Ptv5Cu2m0lucGe7c/k
	zRCfREIkkjl5merhSONkWzDzwgiVz8xmt0GDcemgkevT4HxDG3EOKcLAaA4YAhHc+bRTUK8FgYHCU
	0Eba0QImhVnqhYA2i7LiEZnlG8JBVNyZy66pNzgfSlHztLH5GPWl+8cfyvc6hC7PPa7zV++YMsA3f
	ba9pOujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8tQ-0000000AbkX-3n7E;
	Sun, 09 Aug 2026 19:09:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8tO-0000000Abjc-1Rhf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 19:09:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso13089125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786302545; x=1786907345; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vZGi+iuh+YDljvOzn1g8dcCjbMnjc8Erlh5ur5ioA8=;
        b=BFhuGD3e7CHaq3LYQBJm+ZeoIGdXAF4YPdh1vXP1791oOlMNYBSihAX8LqEAxcKprX
         WexF9fP1+7ReHe/ys6yIPjX5B1S8bAf0yO632ExdSv2IdrO1iSsojaULDdf3yFw/LtSJ
         nq1epIPBY9bDkwBa32b4qRL4rox5fshSTECJOu0sm2udvrfs5PXrWsdStg3lHMkUlPek
         ZfngC/f3aq79xwZgpuee6ah1IhIucYJ7aja88fWqAYAUuLASfjWVJIGm+Fks1FZRE+83
         2H7wQxNYtLkcpRV1fRLBueZNVCvdpHA3+qd4uMMAsECH3iSIjhdjUH6Y3L447LWhxUGN
         PThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302545; x=1786907345;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6vZGi+iuh+YDljvOzn1g8dcCjbMnjc8Erlh5ur5ioA8=;
        b=nd36KB44RvsTyadVv0Ib1hc2Jg3qzKrem9IA7jRxrE2hezYPJ1O9SV5W4fHdWscwfs
         T/Kidtabx83HCrsB042WEHhFRgFuv83RBrzxpBbE4NsWypXoHcmQV6oMCizCfZbnWLXE
         p9vUU4HjWlrxbtOAnCFjucaj71w0faoDWRLvcZTWw4UzMx+sT4L5iEzscxIbvA/k+oyt
         lOnR8o7GQOcEu24XnYH1BR/0SvK6GKg3DaT6hyJj/5asUbVGqXlp/t+zxKVSLI94xAao
         jHc+jesYEhFGYt5J50aVVoJZLTVQFqE81sbB7JQ1o6ozeAQdn/hmPVpsxWyqB6eulYP+
         rsOw==
X-Forwarded-Encrypted: i=1; AHgh+RrgaiKn9nRBoq8Eir2jlxTR61GJoSXvhPz/tcyfWV+il0Tx80UIRVlWuyKTySOjvx0p5omCaSpumvyFr0w+LWSi@lists.infradead.org
X-Gm-Message-State: AOJu0YybPj3ufJCftPEY11gJXdfeYli26K2cvR3bE8msX9gAl6yIa+er
	S6p5pFESprg2vRnSqshWldsilPF1j2f+g9syxJbbh6qnnQsNjcHCbHUm
X-Gm-Gg: AR+sD10SRhrwHKdqHhEQBFjdwjQ8KqEiMGBoOs6aIkQ3Svq2yqYqEHln80cOMNh2tBA
	6BZ0caapD5XYJPFKcbhbfjXyFK8kX2ig6AWv/HVECLkNIf5911SILHK5QJMlM9Vd+Djm2+k/fut
	eCy4c+AJgYrDg/2lfL88HeQLsy8qX43jACMNWGr9UE6F7OcbNvYnJxMbEcSgwDLAVGyA9X+p+5j
	lFizyrFz2VFyyFDxsiw2k5M217TyzuKlm3HhvB6H46zuDRJPSj+28BOXR5TRxZxXzuIOzqS6lpT
	ZX0sSRfE2ZuOxmR/hEx9PM7PVXUfku7jZNhhjzC6+psP0jlkI/bjkBQkTbP47ap5obFs8I6NIDf
	eD4TJcpoE/snewWujm/lol9UsH1W7dGko9iflN2JsrCgg6u6M6Rkvo2LbJxa3Tkt/c+j2KVn37m
	wSNhQHs/W07NXhJD8IrsS9icA/02Dh8F7M5+Fo/lI99zvraEqypZ+3kaJB+L9XwLXdK6G6qXKBO
	JfoqC8dShKSHIuxq/qsT5XnXfZeek26tD+ACg==
X-Received: by 2002:a17:902:da87:b0:2cf:4c0f:5129 with SMTP id d9443c01a7336-2d0caa03fcfmr385767855ad.17.1786302545136;
        Sun, 09 Aug 2026 12:09:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec5aac2sm36971156eec.30.2026.08.09.12.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 12:09:04 -0700 (PDT)
Message-ID: <ff780a8d-c164-49df-b68d-203966a16442@roeck-us.net>
Date: Sun, 9 Aug 2026 12:09:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset
 controller
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
 linux-mediatek@lists.infradead.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-4-l.scorcia@gmail.com> <aniv5B4jz07mI70D@buffalo-ssd>
 <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
 <CAORyz2+op80Tj1Ax1PD8wN9fAT5QfAev+vEPBgihvM0O-tWXPA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAORyz2+op80Tj1Ax1PD8wN9fAT5QfAev+vEPBgihvM0O-tWXPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_120906_397848_5CC1BAE3 
X-CRM114-Status: GOOD (  11.19  )
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

On 8/9/26 11:55, Luca Leonardo Scorcia wrote:
> Hi,
> I added his Signed-off tag as he provided basically this same patch in
> a separate series [1] slightly before this submission and I wanted to
> acknowledge his work. As far as I understand, this attribution is
> within the guidelines.
> 

 From Documentation/process/submitting-patches.rst:

   Any further SoBs (Signed-off-by:'s) following the author's SoB are from
   people handling and transporting the patch, but were not involved in its
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   development. SoB chains should reflect the **real** route a patch took
   ^^^^^^^^^^^
   as it was propagated to the maintainers and ultimately to Linus, with
   the first SoB entry signalling primary authorship of a single author.

I won't apply this patch anyway, so it is for others to decide if
"this attribution is within the guidelines". I stand by earlier
statement.

Thanks,
Guenter


