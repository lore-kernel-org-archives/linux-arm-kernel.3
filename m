Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284B8109B46D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZCByEtmnsNYIdWYLf1KzEBvQz2XTmeXiioZ2Mxrxog=; b=G0BHHOD85YQu3DBAAimO5VVEbw
	3f/z6ijB6xcogRzQvVrgz6xdabUIxpIFOcj3yaWJj5S2tT/TsgGstuPVfjZEaK7HmjqzY17bTKbYY
	3LW9ipI2OHEXiRC1MwDM76p39n3oSuHgS59KWhN4O5zXhgH4FH6ILbXK5f+YspX5PcE7fWhiMimH+
	UNF/TBPhqNpLdmuh+rBrc1b8BMdE33xzzAZKSot1JdfHhpMwhtYxTK1M8Yu5d7UFr2EJs4BUez/qR
	2UYx1VzbHdVRnnOXdjYyRRAfq8SHVAT/HVQEGGfktDioMmWvZCTORiPa+v4Ld7Ax10qn5T7mE3UcX
	uwRtMCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ziv-0000000D2RH-0AFw;
	Tue, 31 Mar 2026 14:05:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Zin-0000000D2NF-0ZLB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774965929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZCByEtmnsNYIdWYLf1KzEBvQz2XTmeXiioZ2Mxrxog=;
	b=FOr53diJS077jauQBd90j8rVYJoOA7q4TMEAk5pjT2nFc7yeENVan8TJyKv8qRR/UKRFjE
	8tELEiPSPpf3aqAn5dq406uvu1vzFvnwXth1wrCRfnUWxfIVAe+uMGpNUpCKeawmBiYr+V
	HevgLm13E1RP3TuSnEavSACAipbz7Z0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-M2d6nnxxMSiZjjjd54J4oA-1; Tue, 31 Mar 2026 10:05:25 -0400
X-MC-Unique: M2d6nnxxMSiZjjjd54J4oA-1
X-Mimecast-MFC-AGG-ID: M2d6nnxxMSiZjjjd54J4oA_1774965925
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfdc479f5bso1609171185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 07:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965925; x=1775570725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZCByEtmnsNYIdWYLf1KzEBvQz2XTmeXiioZ2Mxrxog=;
        b=EprXgKoBx9bORneGYY7ET/r4BGsdWbi+IJ1CmBe6Qy/1Em9SYBQAnjY7mmFIFuyZXF
         sVPfusSeP4ogPfuMgQbaEP1paRxUnm88/p8pGSFNmFpWu4fD2D/Xo8bYRXa0fN44YCjk
         8dzR7vaT+dmmM7zhHYJwWeNJzX3FJ96P/1g8FNZnIFUfvj59LZajNxdmboJHtB+8oEVW
         7sSwfIV2Hqm7GJiODu831cqaCm2ldlNd6vdU2AdbgwoH/ia9QiBaQxFFEXJo8HDyUI87
         0zfNb9Wbmrtx470jsDjw1f1OuuoRUb7/26WInQ54u+LTu+llYDdtXBgSVZ8qcElVRcIu
         fAVw==
X-Forwarded-Encrypted: i=1; AJvYcCVLg5nj7m95cHjCm5a3gG7dt0wZRNZUqUgKpjQqlzgotMdnVpuz13IpNfIN1ugEe+1FPqUqYFgqAmnm3otLkgwa@lists.infradead.org
X-Gm-Message-State: AOJu0YxaYBo4fV3O1DuPWKrcB11rTwVMD4T9gUVeId+fN/wHETcySoOw
	AWq8mP1OjmDdZVErbcH97SiuMOris6bw+dODaR8+obBRovss3v5IF0zn9SdLUOSAQwqfTBoJjIZ
	JVbRKIhANUSAyR+WiXRS2qnmK72XEw9qw6H8EAL6OCnqufprskJETbAtjyEnv/vyERxaQkqv7sT
	iT
X-Gm-Gg: ATEYQzzsbU5xoPwmqT/FtsrXJUNNV/+tqahCOH3Vvom7ptnlhVZjgmELOz0lk5AftzI
	k4n/r12wXQTjJJBVmephtKSQJn/cLzmJyk4MAcjFYLOMDBagCUNb8AgMalLI8Beggj45SOQwDAw
	qQ7POlcyY3tWP5pf2jQm4nNtfcwLL29NlWSFM0QrSb22FJ/BK7GzAGLUVPggoBVfymjBEmgsUuY
	Yx83kAr1DQsmi0mmyi9TOu3pSD1+/nKWZ+Af97WaCk1Liut7lm4rFdJMtZFcELEPT5P/ivGUE1g
	VSBX2dzyEU3LLn98ofnQOm1/9nfVUNZqa0RM/t+SMKGLyjBE1NBOXMjA8lEd0Uz2Ac61T13KXoL
	KbeKU25dvpqh2MRlc
X-Received: by 2002:a05:620a:44d4:b0:8cf:dfc9:c0a0 with SMTP id af79cd13be357-8d01c616e7bmr2226417485a.7.1774965924882;
        Tue, 31 Mar 2026 07:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:8cf:dfc9:c0a0 with SMTP id af79cd13be357-8d01c616e7bmr2226411385a.7.1774965924295;
        Tue, 31 Mar 2026 07:05:24 -0700 (PDT)
Received: from redhat.com ([96.66.166.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb8e0sm1021432985a.8.2026.03.31.07.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:05:23 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:05:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] clk: kirkwood: use kzalloc_flex
Message-ID: <acvUoSOOF_9UQC75@redhat.com>
References: <20260330205504.10143-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260330205504.10143-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ivcr1w8vh5b04mQNvvlRbO4kLVbUWpk_O9T8seVL9ZQ_1774965925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_070533_239361_D61CD9A5 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon, Mar 30, 2026 at 01:55:04PM -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member and kzalloc_flex to
> combine allocations.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment to right after allocation as required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: remove unused goto.

Reviewed-by: Brian Masney <bmasney@redhat.com>

For the future, if someone asks for changes in a previous version, then
be sure to CC them on the next revision.


