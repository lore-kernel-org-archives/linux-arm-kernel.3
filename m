Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD00CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvGPQzQpGFMeIIlaW/c5GkziYATDo16EjcvpZHOssqk=; b=KAVKLdmbDEkZ6/JJ5ihL+cso1Z
	IQlsINM+Ye3Li2vHNcRcK6lDI6GFNJIYZGIVqJiQNljb7b/jVlZeoJlIZ1Y2XknMHftYVPBDtz5Co
	7jpVvPMYuujygM5Lc7a9SvDf4OpKYNUNsDhEWiqm+T2ATgKqA5+KR9A/c7VpMvARkGBDHLiwOh29L
	smIItndaDKY5ajRcVhhg+grt/0A+gS5oHiZVXWWt9B81v8UUNWPjWe0aCBzZ+8ZtjRO+kH9vN+S2+
	VqvZQLBFU2sYTELWbWgvbHKa8Ha00inR3znky7f8lw9679/1rDfP3MU5klTHY+Ytr+jO5huhB2AHb
	aFTYG1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoU2-0000000H6xM-2unX;
	Tue, 12 May 2026 14:53:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoU0-0000000H6wi-0Gmh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778597595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvGPQzQpGFMeIIlaW/c5GkziYATDo16EjcvpZHOssqk=;
	b=YdMsNVtriymorzt66zfByRU4EBbxP7RXaoMg3nbxI3Vh0Xlp6e2ZYscrJgd5Vu3hDc8t7b
	m0arLE9iyoSkT6ly9bDf3mfqdrmQhrO0WeM+3P+wKW37jYhOytEI4DUHNNmKJe+FzUk5kV
	kMj2WG0Vw7AzyJRUzqDamPRB/JKQqgs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-R8ftOK9nMIauqXiwXYYDXg-1; Tue, 12 May 2026 10:53:11 -0400
X-MC-Unique: R8ftOK9nMIauqXiwXYYDXg-1
X-Mimecast-MFC-AGG-ID: R8ftOK9nMIauqXiwXYYDXg_1778597591
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso80058631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 07:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597591; x=1779202391;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvGPQzQpGFMeIIlaW/c5GkziYATDo16EjcvpZHOssqk=;
        b=RpM8igk7ZZQhtoabhz1j6uJxW52KAoWzPIwjj213LSta5wz8E2oPZ6N6mcEGFTPvDZ
         e84AsoLS8G1YHE/IiCZti6idQ5VQ5LY3k65h1ukJPe5JttflNHcMlZebC6Z1nI58gkwa
         dGXvM6+KSvJ5/LXrkfi6UPFtYX1bFualbr/OKrEeH9tCVawfhim6oGDzJp2wt7Hn/aa5
         GiAzfZ1glmXIFEiETpPJB+zAizV8GKIuMWMpWoLFxBoEOajhcBozjayxK71nGwiqUpR8
         CyhpAqOFBfepXLoPp5vdSciRBc6IOxpzeH0aQduuyZnb87J1M0OWXk8qOkGw+YjxYmmA
         O6Og==
X-Forwarded-Encrypted: i=1; AFNElJ9zmfjhHaJgoPRxs8gDHEcZ90AdRWb8XeUQzsgZ1G6bZmUUNnRJf6Q4dQEg5A80f7E2zMR8vrjcWg/+4S4vpiyW@lists.infradead.org
X-Gm-Message-State: AOJu0YyhI7O8d2Z3lV0r9fWdZ4Jx3qnK7x/yA0t/OisBXkuKSLQSbVmG
	zatDe/CXnAybcZBwk31+9ZZRe6RvI3LGK7FjFKfHOQadMQKg4VvWplqLlR2IgSV9zA7iRuvOfQb
	qSWqvtQK1haavpOe4gictWLnZRWUdRn7D70oCiaIe2TYh0HMeC1+nFVytTSSlLn4Lw/2mSen76F
	Ou
X-Gm-Gg: Acq92OH2/KiU/aLnEU771O2q/wyFXb8K3lbC5X+FFmv6N6gMs33M3lPgJ1KExPMQQL1
	Vjz18s0DKNfcBVoX3JBf5UgZza/WAFQivvcRYbazKj7FxFwsMbmuOH8zpIzTDBNqh9s9wV2ns9z
	jXDXRR/7zxcSyLiga6RYLF4yM8Yojlb2li2rfI+HkXACXWPXLNl12suAjM5A2y99Wq4Bb2o0uBO
	Em4kP8MRM82buhXIQVSezLtGYxJUYvRlHoWASB+GvXOMbAvHfx9r2yxPNHakCVyJwYB6pTd3lOg
	XEU0iauynmLaQCk1P+FQS++CC17CniRvEHc9vTRgT0B0PFq9j9FUIJS/nH/NXhF1UsbwqLRQ76M
	TC4Zf4zAXd3Ch+xKhHCK1EhTVbpI286xDDBc/ly4dOYTX3/NHgl4jQJf1
X-Received: by 2002:a05:622a:8612:b0:515:189c:e0fc with SMTP id d75a77b69052e-515189ce412mr15568671cf.21.1778597590784;
        Tue, 12 May 2026 07:53:10 -0700 (PDT)
X-Received: by 2002:a05:622a:8612:b0:515:189c:e0fc with SMTP id d75a77b69052e-515189ce412mr15568011cf.21.1778597590146;
        Tue, 12 May 2026 07:53:10 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148fd8bfe0sm120111651cf.0.2026.05.12.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:53:09 -0700 (PDT)
Date: Tue, 12 May 2026 10:53:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nishanth Menon <nm@ti.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	afd@ti.com, sozdayvek@gmail.com,
	Jing Yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>, kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	David Yang <davidcomponentone@gmail.com>
Subject: Re: [PATCH V2] clk: keystone: sci-clk: fix application of sizeof to
 pointer
Message-ID: <agM-1KOP9gZqxh_f@redhat.com>
References: <20260512110028.2999471-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20260512110028.2999471-1-nm@ti.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QliXLQv4nhXk-zP1eiwSBcwtVxVsJjA-DGDzqN-QPWg_1778597591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_075316_374811_394F830A 
X-CRM114-Status: GOOD (  15.74  )
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

On Tue, May 12, 2026 at 06:00:28AM -0500, Nishanth Menon wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Coccinelle (scripts/coccinelle/misc/noderef.cocci) reports:
> 
>   drivers/clk/keystone/sci-clk.c:391:8-14: ERROR: application of
>   sizeof to pointer
> 
> In sci_clk_get(), 'clk' is declared as 'struct sci_clk **', so
> sizeof(clk) is sizeof(struct sci_clk **) which is the size of a
> pointer rather than the size of an array element. provider->clocks
> is an array of 'struct sci_clk *', so the canonical size argument
> to bsearch() is sizeof(*clk) (i.e. sizeof(struct sci_clk *)).
> 
> The two values are equal on every supported architecture, so this
> is correctness/idiom, not a runtime fix, but the new form matches
> the rest of the bsearch() callers in the tree and silences the
> Coccinelle warning the script flagged.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Closes: https://lore.kernel.org/all/84a6ba16686347099a3dab2e5161a930e792eb6e.1629198281.git.jing.yangyang@zte.com.cn/
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/all/202512040525.zrHSDl5h-lkp@intel.com/
> Link: https://lore.kernel.org/linux-clk/20211012021931.176727-1-davidcomponentone@gmail.com/
> Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>
> Reviewed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> Signed-off-by: David Yang <davidcomponentone@gmail.com>
> [nm@ti.com: Improved commit message]
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


