Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 18:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qZNEU8TLi2B72MvhZC50cLWKEBNbNUsr7u728Oim+M=; b=vXBztIvxS1Fq5HdecLc0mxCC1s
	WlmeN9eXDWCyqMKpmOB+OS36AoqLsJQEJ6ljG9AkaliUuC5VaCxta7Bqo42I8AlGmAqES8YNov3ht
	CfRKngAdhPAmO7g/Cl85aPRCGdKplU4GIxJL8f23seh60q19k3Sk8arBY0p0n0mT6mVixnQ0joET4
	BlSC9czifwuWFEQkLAy7TZc0qEea36TFlO2oEqgdXuLaz4y+NwE9FJ54kjvopZorSZ40b6GXM1Guc
	tRvBtD3kNDc5ARcLiXYgBWlilr3c6+jd3lMNYBhoNBvXXxe/W2JIhDZZ9BkUBnIk1YBEDGYNBRQ9b
	kH84Z1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdBR4-0000000BlMq-14xD;
	Fri, 26 Jun 2026 18:37:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdBR1-0000000BlMB-3TkW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 18:37:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c1214dc027cso136934766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 11:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782499070; cv=none;
        d=google.com; s=arc-20260327;
        b=KknIuZv77/ieydJUGcOyo5+ugvOlMWw2H2IlPoieP5wOg/9LnPeyvN+cy1Tp0TUOPD
         yikHqUeXIlGv/owmVVY02L4O9KWU3d/1/zwUTu+SsWS+QcovPRCRNRXC2d1z9P5R6v43
         MJnrPXTDHb7aU+hz+vLa+JrewYr2P/+MSYSxhHNHE4QaS58U6oSLYfKZFRzAIV9XJ38F
         Afqcdy58yeTf0uiMBHRTCE8inCmAwhHgkps3Kz8CBBL+7kekJZTMcTflEzEWzWyNR75W
         1xcIRhAIJkHw0cwxQOImclR2uU3nPQAf+8qerOQKx9FBU1eA3Sv4Up8R5fL5v/YqYQXU
         DTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qZNEU8TLi2B72MvhZC50cLWKEBNbNUsr7u728Oim+M=;
        fh=T9n9WLuw53toTGIiuxa95YZTXFT+IQODnHcw/KJzk30=;
        b=QoCpC8j1mC422MJBgnNmOVP5/zX4mkSaMko5gSCs2/xPnjanW1jyiPHDwobnwk1Pxs
         tdsrx3Kz7A4ocI9aJ2M+Wi90b9B9pPVExv6wOJ9Qs+Oy0uJJqFvCuuChvYI1lWAIHi7g
         YYXCD0Ba+E/W2B2A64uZnPhpTeMRVnertMEUEADwlqWG35aOD2ihX7WgfFlaf54aCdrn
         eb48lGTaRh8UcDH0ZANVMoPsJ6BpG/gy+MxKZ84D/8wGLhCpipZxbw3D4kpz2pJwK3yq
         YGPjpzFWb0ELG/kDC4oH0uazaxd5NDJ85klqCYXOuNRseNeW1EtmBdLRuRbSA0Nrqnlf
         D4yA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782499070; x=1783103870; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qZNEU8TLi2B72MvhZC50cLWKEBNbNUsr7u728Oim+M=;
        b=p7rX5a/s/7gMcXYfp1Mv7pI75d01syy6jNKY0qGe6TtHSmA6oawvR5shLdZs8UlD3E
         poEV/S3v0h0bwXXr1ucdo3uL9HGZ9aTtM8aAxKK9AsBx+mDuTVIOMqAb99jhk4eKbaIN
         tZJE7O8y/JXyyw8nibyL8PyVHp4FPUK1HtLIOPpYYfhayqS+lmk+9nEqlnJcjefOlLF5
         Kx5AYY+qwiNCv8cGOGamr1kX8dm9nJb3o2Er8jXZEGW1BsLP+6/WfKqq/gJm4cIDfPCi
         uNJK+kBKA4Y8iR7eaoqtbRfwOhZwscExL+wVQI7GwXbN/UBi3Ta6jgzHgxuiETk7/umF
         FFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782499070; x=1783103870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qZNEU8TLi2B72MvhZC50cLWKEBNbNUsr7u728Oim+M=;
        b=p7CA7wU6MZpiw7V6PIYynS/pTXAkI8ZvBAFxc+kr2KfuDYrSmSSlWC4R/PH8XQP7fA
         jMHbuOsd6SR5fzCiVAapFIWANwZPPv46UYhjVFcVXlFqDZzAVSZhHs9phCEqRIpy3rcT
         KV2F34lt0oX9roL0LSoZjsSodFr/22/dBlAiR551xn4YMVQoZxGOXntxCBn3rLxw2br2
         3M0buyYHxeQaHg+EWoyA9puhlHvgpQSBMERxUilo2xEWhBkR972+e8leDeGQMbrpXsca
         0kkt6fPZTSEX+w159AtJjyXDuMhjtfeLmTnzY0LI/0q5eKH762uZd9I8Bh5n+5hC8WFD
         wINg==
X-Forwarded-Encrypted: i=1; AHgh+RrR9rJP3r552KNwlvrpNTpecrEBoQ70z0oLI9/AXjcdt8+JBcT4ivBexPwCa2a43YzlVECeeNubSg0MYcFtmXp3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp79TgHBB3vPC1qiHgDQ2O9gf20UYTA+A3Y9k6JE3lJkUs1IUh
	FEGEO7TQQ6WbYF0EOI2mf1Y3sNvitcRRZX+7a3XJWngViEyIkn41nOsgvoSXHiGkT7K0HzDae/g
	7o+ISjXH220WH7oYmP8ssyW/Zr1G4mjM=
X-Gm-Gg: AfdE7cnDjVdyX73NxxsHeGBDYdZ0/BPqyDgw/aV/MzPubmA8De+cjBRKiZcq3qpxdnD
	Om5BqyierOls2RJJSaelhP0M4UFKKErqboY7EnJ+u8kNw3Qj83Ww/8Fz+HOebQInI8G1z7cCfjK
	MWf2bq8mxogJNUJaxyE1YXpXEJK64LCx3VY2cnGNbaxWWh7Zqw7FiH09tUgsehyOl/AxcFbLDum
	bm1b9NsIW5nACMcllTZn6m46XBUXlIGrcooI4zp7+aCz4JjkpSaavLQRfHfRO5uj8bDi3HQOA==
X-Received: by 2002:a17:907:3fa0:b0:c12:2946:ffc4 with SMTP id
 a640c23a62f3a-c1229470a5dmr209546366b.40.1782499069483; Fri, 26 Jun 2026
 11:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260626033747.1515585-1-dbgh9129@gmail.com> <867bnlqv0e.wl-maz@kernel.org>
In-Reply-To: <867bnlqv0e.wl-maz@kernel.org>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 26 Jun 2026 14:37:38 -0400
X-Gm-Features: AVVi8CcpEMiWPBB2T6yyifV_4QnLIgFoI93iyNU8tqmdsioXlvMhAmHbD1WBBqQ
Message-ID: <CACrCO_UmXQQrpaz2Fd32_JX=ZaPtY8z5Rk7rRh9be7=sp9v9UA@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/gic-v3-its: Fix OF node reference leak
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_113751_869213_4F80E6DD 
X-CRM114-Status: UNSURE (   7.86  )
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

Thanks for the review, Marc.

> Please keep this on a single line. I find nothing more irritating than
> these split assignments.
>
> Worth taking this opportunity to fix the indentation here.

I will fix the assignment formatting and indentation and send v3.

Thanks,
Yuho

