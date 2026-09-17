Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA05C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=; b=EPxTuf8cGgGf75Gc6GbWz4D/Xb
	VhZtDLnSEmZ98xgKT5xqPCpLqKx4d+BZ6Dwlkl+u5L568/zQLLAycdFOlnaD0JAcfINzf4JTnf7VS
	AbMQbIYhCA3PnJSutAOYZ1mbomVFZhn2AcswLNWytCmsiawdlKfDNuhNdr/+XN7NnuNZuuAHioPu8
	NHWWd9vFfpdKdt18rmwl17HO12q5JJ9gCZnYJh9t7t2x0YddEq5HtIiENM3RwOmvFPmyx+TFGH/b2
	TEE3B+DUdMOzgr4rHhGPzExt1EM+dI2H6fIcwqhqtI/1DJd5JGO8y/bJGYPCxZ+MPCz+z0p6F6mnW
	CZcpYfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DiO-0000000BdHX-3Qkg;
	Thu, 17 Sep 2026 15:07:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DiM-0000000BdHD-10Nq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789657671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
	b=Qr836y6DqCgPTLwcvVp8taBKQUSdhYJMI9sBOpAG1fpPH3L/ImGcf+WbYcuPsbgCsAuAGV
	HBUQ1xvikVSB9/3FEUEOFntlX65PlAl7qgT8OdUsXdvhSE269ZUu76xwVIac8lsx+ZCXtx
	K6BqmmrtPGrKWCvQzzMAVLng+597AIA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-XvSxWZ9SM1-PWbJkCih4tA-1; Thu, 17 Sep 2026 11:07:50 -0400
X-MC-Unique: XvSxWZ9SM1-PWbJkCih4tA-1
X-Mimecast-MFC-AGG-ID: XvSxWZ9SM1-PWbJkCih4tA_1789657670
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e80ce3597so21039336d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657670; x=1790262470;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
        b=Z1WHTV9RofzlYmXwuI7oeaMjIHpRYVGQ++bbwFlrNoFPiZD+ubk9x+uqq7vizAzRyf
         h6rX9pB0H8GsoMj+Ow33NALkOD3ScAAKT+krOilT7Z9Jgl2ahIO0EH799jiB43iLT9Bt
         ydAWVm/EaQpLIUqllSpOQxw4MG0VYD0Hvlv6z5ZKACwuwxYfhO2uUvTe+ybZ6kfYpMh5
         0xVd8wJ4pvnTaPcUeAt4lvE5Vbuk3yMWOeoJT5xwHzAtbeuVY4DOHVgL/lDkzrjVV4tt
         XjAhU7vGD393EQgmwr804/fh1ukFkZfGiwG6zZjLz94//liUlIIsxYyJ40qQv+rekWmV
         fXYA==
X-Forwarded-Encrypted: i=1; AKwUvBzPfaUpU2BTG/aAhvU2k0/65sNq3wf03YiDNpzvYhP7DvK2AHSTPkpeQ0BJzoXoiX2YWH0JCbQucAceSDCHZ5vx@lists.infradead.org
X-Gm-Message-State: AFuF++kyj6qdtCyRXDqQlTlejbDqucR106OQTCOGMCZTsRPha42oxO0j
	2JuB2tg0uJB+TEEb3a/k+CkumL5FkXGm1E/tFlU25E1CTiHetfKxSwFk5d+v4dk/3DpBHw4EFYO
	ILm+KGjKi7Fz3Sm9fCfGkqDiGLhc3aBoIxd1ldfWpQXJjozwG2XKJL+MWza+gC6wOoSBzCtsNf0
	xB
X-Gm-Gg: AYBFou1WjEhP/FjMMNagD+AfZP+Wrr8mhlivbz00pJhLC9Oti2DkP3F2m2CspR9pkjn
	UYB25iwxbYEPXzEMDHF9P/nOMIls0GWhSNG0Tx8XKf0G1+XVrNnw/oI7ynircyELhS+/xMYbX3r
	UV0GEAi/akwujnHqCBcFlv0glVOKIV/CJ64UIHKf47TkcuH+3INz9khND4V21rgkPq4LPIRU8oZ
	o+hgIt0WT/u+cmvorSih47HAA9Xqd3GrvhbGY1v4Gw6S/CHZX4fYoAkkS78DopvpDzD+s65B9FC
	DfvNkbtwRgLbGneS0+iBkE7lf/xKQop/K7JOJwpiBQLwiKhVYKZqVwux1OGaFZRmruo/aY1M8k3
	rX7cSNJ54GkQUl7h5Fi98tAV5S/NIVokdnWcUuz4=
X-Received: by 2002:a05:6214:2528:b0:912:3cfe:2dcf with SMTP id 6a1803df08f44-9123d722381mr122578676d6.4.1789657669520;
        Thu, 17 Sep 2026 08:07:49 -0700 (PDT)
X-Received: by 2002:a05:6214:2528:b0:912:3cfe:2dcf with SMTP id 6a1803df08f44-9123d722381mr122577906d6.4.1789657669090;
        Thu, 17 Sep 2026 08:07:49 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beb4884sm53020536d6.37.2026.09.17.08.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:07:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <hppiscas@163.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906033924.84982-1-hppiscas@163.com>
References: <20260906033924.84982-1-hppiscas@163.com>
Subject: Re: [PATCH] clk: milbeaut: Return divider update timeouts
Message-Id: <178965765056.360090.17314142622981965069.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:07:30 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=294; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Zw0k9Wy8piJ6fXZzS55E7Sk9e3u/FCgs7eWCZAOw1LM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWMFkzxxy8tU/vtPXT5zMC10rp8Xi55LyM3ls241nW1
 47Vx17e7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiW14y/A8s+zJz+29Hoe75
 rBftzdJOZLttuj1l+Zq+Jwrfw3QNUm4wMrQELLB+OmHS3l3LC2e3H7riUzHl6faCFwLHe66fC7S
 av5cJAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 36ML_XVbk99IG-Q2AO8Lz2UJDrUSLrdmjmnJKvyFVbI_1789657670
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_080754_356194_D4F33D03 
X-CRM114-Status: UNSURE (   5.51  )
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


On Sun, 06 Sep 2026 11:39:24 +0800, Pengpeng Hou wrote:
> clk: milbeaut: Return divider update timeouts

Applied, thanks!

[1/1] clk: milbeaut: Return divider update timeouts
      commit: 526066a4bd5658962800fa64bd3e5432e1f7f92b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


