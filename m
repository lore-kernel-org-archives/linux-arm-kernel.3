Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=; b=ds4PodVf952nodPIg0+pDqg6l1
	TL1tyK1zL5++/4fX/S0qoAV0NM8NGJemYHo3Bx1aSVGOFAeqJ807HjX36dMjK7fIanJlTG75lGGrj
	AxQIH7/nbq36uEJQAqK2D8ar5N3LwcCyk8c1WYyhvFTVbhEUjlL9Q+lktnhr/HT0v4mecvjdvXieT
	g4XjP8PKMBVDLVeP9xupM9KZK6MGgH4VzQf6GO2rTP0oVzvPCSNruG48ENTr/3J88cz2oQD5ScFy+
	B6YLIf4OWjbazqsIKvYApafTYGDwlm1ZSqiYVXg7xQADDiBa3QQYCmmZGyxhFTb7aCmYgse0RRItk
	LNyJi1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPp80-00000005whF-2lRi;
	Wed, 20 May 2026 22:11:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPp7y-00000005wgQ-0XHa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779315055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=;
	b=CwdgPJI5enHFtdkCsS5ZCwZJeFbYn3T6H7GUMjBbAFcLoy8nZP6+3CvhsLhYdbqQAGJO6R
	f22Mztnmd96EzIewK0bWP5K4xNZSg83TLmFdsJOD+NyX8KP+2c5kndrxWTuiVpJ8rXBg5e
	oj3JMSLHvcJdX3QiC0jmAYb1MQhtoLk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-w5mUMmYvP3yUlGkYtsrS5g-1; Wed, 20 May 2026 18:10:54 -0400
X-MC-Unique: w5mUMmYvP3yUlGkYtsrS5g-1
X-Mimecast-MFC-AGG-ID: w5mUMmYvP3yUlGkYtsrS5g_1779315054
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-911cf6eb48cso1298221185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 15:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315054; x=1779919854;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUlhTj/LDnGR8NwnkPfh/TBbgWAfcMJHYKZWXxRTj+o=;
        b=BeK72q73Zt3qXfh7+UmjzZ7LPd8XEI3DX4Z6jHHSKCSvefYRR0sbA8n4rOJq11jUFx
         JM2Xyx+JDLVUwanp1MrDs2McsMBjflHNJ6yvuomrBTvLAh640ZVZqpc3UYdxG9MX6UOK
         pBHSJAGbQVFsjgK0adBBbsuSOzXWtkzJTDuPXws6AElu/xau7xAA4ZwSqN+4iNMjcpy8
         gNF8laj4JsKZJ+7ef2wAI3vOXchf7xw8D39BOIz9zZAPKoRYaCBdW758BovPPbhH03xr
         XWWj6YjVNUSmNY9c+kzV5BW9YPdCb8SypWN4fjB3Tp7KIcMBJVvQ71RBacRv24La8UqD
         NxXA==
X-Forwarded-Encrypted: i=1; AFNElJ9Kz0r1o7uWBvHfPL1N1f1U1b4uY/9Vqx+Dxov6aJ6VmBkIBnWAmVpwwOQuHOdRndO0ALmZDBgxnUjU/tT22BSv@lists.infradead.org
X-Gm-Message-State: AOJu0YxPiOKVo5BsyvOcLGS2mldpykLA6BJUvJdyjXu+YJ17URvrds0i
	V/uGPr/65SlfwTCQ1oy4uAGp18BArS8mzvZOWyBlrHk/QJJ84psGfmoVlcy8CcuMFhCeSXxtid1
	sQeMOTXVkLw9Ce7v4HaWX4bU4Hrg/0kuQAYsj/G/Kdrv6GksUDvCjfJIanWHNMC9jIcpnKZFJI1
	W5
X-Gm-Gg: Acq92OG307OXKKTU8ne53uq1D4DLcjOaMgh3R08DNqFqZyc7Hj2377wtjgb0LprnNpY
	F76FtOHZjZvG2vpyCUnDNUHxvZyYkG9m9uv9CK07dWc/fDajn0nIKUU+O2b6gB5vB8m76E+19bg
	HDvgIVskfCVc7q32Dp6IllyNl8IbMUZuq3K0adbA/WnkZ9H1Ztf8ODe4bZ7+3Jew9AXNAZ4AD7e
	xeiIJ3UCYAi2kHdC37VH5k6oGNASb4/TGIHAuX0J3KceYFUiPgVkbKxH7V6z8FxrVDfCak27G/9
	TgxSNvZbJEr0lVng1VFrYHrRQirINax9Uswf/7+jzjJlLjXtkap9Hyoc4aqQSnwL3EC9C9B5Fsv
	jomlJEqQefH2X+r1bLHu6g3woN7A=
X-Received: by 2002:a05:620a:370a:b0:8cd:8938:f000 with SMTP id af79cd13be357-914a2ce9f9amr16389285a.28.1779315053909;
        Wed, 20 May 2026 15:10:53 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:8cd:8938:f000 with SMTP id af79cd13be357-914a2ce9f9amr16384985a.28.1779315053518;
        Wed, 20 May 2026 15:10:53 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bab3a207sm2240740085a.15.2026.05.20.15.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:10:52 -0700 (PDT)
Date: Wed, 20 May 2026 18:10:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: stm32: add missing bitfield.h header
Message-ID: <ag4xa-WmnGti3naD@redhat.com>
References: <20260519222639.34508-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260519222639.34508-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6QozhuWY0u9k-UNunqnF7nw0GhEb5ehoJIgfVprM4vQ_1779315054
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_151058_241369_4AF69BB0 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, May 19, 2026 at 03:26:39PM -0700, Rosen Penev wrote:
> It seems some ARM header includes this and the build passes there, but
> nowhere else. Note that the driver has COMPILE_TEST in depends.
> 
> Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


