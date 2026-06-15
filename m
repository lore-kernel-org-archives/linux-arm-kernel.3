Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1C5CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqiCivCRQvHY+CsTahzYtUmnxa2excZbQQLs4Yc0u3c=; b=BJ/ZQjFRtVI5RJ5YIjEj7pCXiD
	zOo0DDt2O6kCaBaZQ5GghWJqGDSNXPcW2XO1IAETtOfjHw/wc+BxPnSRtEXgiWpJaiwywm0phXi3D
	Uo/UX7GElAYY2BNpSlKRkTfZEBbXDsOOrgwHCqd//o+R1mPHq2Cmc19k5T/CUYnnt3iQipnZiqVjp
	iuDIAdlJxAi5oIki44Ze3V6z537tZ1WoTc/DVYFEasCQtIXvPutghoKuT5+TcXU6Y2xf0NRlq6a6C
	kbso+JW5woUp6tEW324wksBhb7S6Yna/eKUnIoGhiKBVg5IeaHN2CAGpwLLUDf+emZ8/SrJSeF5WF
	eHeiTNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9r1-0000000EXip-14T1;
	Mon, 15 Jun 2026 16:08:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9qy-0000000EXhh-1aH2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781539676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qqiCivCRQvHY+CsTahzYtUmnxa2excZbQQLs4Yc0u3c=;
	b=Z35nCOD5veCktEGyDXyHoIbSwp6Y8GD5AhDmqzetuJgd7Pv+igPMis/1UoxGCZKqBuSF3o
	TY89HEtf3ZYwVWoc6Jf3SEDhe2GtD9VBRwHDotdk1cKelJ9vSZ4H7NsMhf5i6A2Ff4OftW
	Ux9AFUKRaCy5XhfkddYkp1AmwcDqrkg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-G2bxxTZQN4CsVUaRx4wFzg-1; Mon, 15 Jun 2026 12:07:53 -0400
X-MC-Unique: G2bxxTZQN4CsVUaRx4wFzg-1
X-Mimecast-MFC-AGG-ID: G2bxxTZQN4CsVUaRx4wFzg_1781539672
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce1cc8cb2so73614656d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539672; x=1782144472;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqiCivCRQvHY+CsTahzYtUmnxa2excZbQQLs4Yc0u3c=;
        b=kQc6UysQvHo6I9j+z09tsGd37ENiMMhJOJ56c2kEtS0KZmlKi1HZ7CsjszOz+Y9hin
         t3//+DqKkjuHnxrOE2DYySa+fRzJ2lwmlV/UPr3d1sDkWQalmLwd41Kejhk6665S0Lh7
         9Sq5u9xTL/lOEneKdF4MnZ4vC9H8bTjI/ZgviIEB6y96LbyksK49gTETM97Cr7ksS91v
         KmVTXRZLImYFo/LePQa6GwfB+OoqoWVcH5omT9Ehk61Sv9Mu4MqCRd7EZil9UObIEHwD
         xmWqYPh3Op6FWPhKw97u3MmDHMTJCpAa59gxxjmyKEbGrWM4eJc+ni6ZlrOhf2UQKtZu
         ACsA==
X-Forwarded-Encrypted: i=1; AFNElJ/JHZkaB+eSzF6CpIk0q+ap7a8H3lpmubn53yDUA2vjWG/lrBlkf5Qqzw8sAVCde16pg7L+/y14pL7T5eTZ79gc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4rYBuFxRCGxC7XOuJntGFQuctb4cXBinbQFTRAJ/SfrOhJ5Nz
	u49kmpUwWRUoaLDRU7t3sFjVybdZQlghH48MVjxNEoqrVf0JND4F+eUTTIM1mr1BKjplnYdVOa3
	+POycl2+c5Bc7JmazftYMPYvjGySe9mkFZF5V1bvrOtqmnQOQAsIDx+vxyMQFwXOXC+e3Gkw4fB
	aL
X-Gm-Gg: Acq92OHjg8j4tvd8iRHZEVI8PLdIVgkds+EHGyu+ynhJJ+JpTP6mOAUPBupNQYRRo1/
	cGeMPFt1Jkud1YaPU8Y9X1GjttEyWhHq/q29P8eQMO+cYRWPcjcXvqI3pReiwrwtUB4n+oNQ94p
	YKgVaJErD+bdMUjDQHEK4zCDlJ/zNbsKBfxwkHzL8keN2VU/aFBMs1B5QUL2eqkOGMwvCE8vz8V
	MndllF0xJPoGx5BLI+cuRIFw+TnQGwCwlT4Z43rY6WtIg+D7/oH75qdm02pXx+l+ekWcicy/gRE
	HcQLl9PcS9LrBAJhzomY8lBA40JNndVRyRTE396ck7Azyt2eTBH9N/eSsXwEY+968BbXKA5ZZhy
	TO5grp9NPjeRoRoMdkI19q515IKXva5w4w26+LnhlEOJVRbjKw3fu7ZEP
X-Received: by 2002:ad4:5687:0:b0:8cc:e8f4:1636 with SMTP id 6a1803df08f44-8d9fdd239b2mr3018656d6.25.1781539672173;
        Mon, 15 Jun 2026 09:07:52 -0700 (PDT)
X-Received: by 2002:ad4:5687:0:b0:8cc:e8f4:1636 with SMTP id 6a1803df08f44-8d9fdd239b2mr3018186d6.25.1781539671714;
        Mon, 15 Jun 2026 09:07:51 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f1416a6csm2722726d6.3.2026.06.15.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:07:50 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:07:43 -0400
From: Brian Masney <bmasney@redhat.com>
To: William Theesfeld <william@theesfeld.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: zynq: handle kasprintf() failure in periph_clk
 registration
Message-ID: <ajAjT2oiAjFPJ2Bb@redhat.com>
References: <20260601203500.658135-1-william@theesfeld.net>
MIME-Version: 1.0
In-Reply-To: <20260601203500.658135-1-william@theesfeld.net>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6siGM7y_ZzP-fYnmPxSEyzl-gtYiPMB09niIfZAVBLs_1781539672
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_090800_579755_BD4E6CA6 
X-CRM114-Status: GOOD (  16.88  )
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

On Mon, Jun 01, 2026 at 04:35:00PM -0400, William Theesfeld wrote:
> zynq_clk_register_periph_clk() ignores the return value of the two
> kasprintf() calls used to build the mux and divider clock names, and
> passes the resulting (possibly NULL) pointers straight into
> clk_register_mux(), clk_register_divider() and clk_register_gate() as
> the clock '"'name'"' argument.  On allocation failure that name later
> gets dereferenced by the clock framework (e.g. in debugfs name
> formatting), causing a NULL-pointer dereference.
> 
> Check both kasprintf() returns.  On failure unwind any allocated name
> buffer and the spinlock, then fall through to the existing err label
> which sets clks[] to ERR_PTR(-ENOMEM).  Freeing the spinlock on the
> error path is correct here because no clk_register_*() call has had
> a chance to take ownership of it; the success path intentionally
> hands it off to the registered clocks.
> 
> The neighbouring zynq_clk_register_fclk() in the same file already
> uses this per-allocation goto-label cleanup pattern; this change
> brings periph_clk into line with it.
> 
> Signed-off-by: William Theesfeld <william@theesfeld.net>

Reviewed-by: Brian Masney <bmasney@redhat.com>


