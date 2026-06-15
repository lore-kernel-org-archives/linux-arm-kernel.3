Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9513CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZr+ycgvZUilxhhoW/bzv6nOUngq3yd4joV7dFf5q7I=; b=2zFwSdzOagNHTrwZhQRNaw+whT
	ZF6+hONV+GyH3WiQYu2tVJTE+r16dGiJdsBt/4G+TJW6XmmvFzHHB99lQB0yuMRb8dEHBEvoa4Png
	aLSoft2tPTtBVmPvsYmBPQHfmf+yU+ZpFfqqxRiYPLV7YLuIgMa9Ftf0a7kpVHXvHLsW9TpNh4wq6
	w5Ntf/p4BgfR1pt9OYkiBiZEzUWxemH9AZzZV37gUZ3kayfQqU3PcNjDYQEUaHevStTAcPO8XUHhy
	Jb1RIODFiXYulG8/BMVzGpOc+zhf0ggJvj0OawLBocL34JOYrKRYRmee2SEncviB4t/3oCCC/qlgQ
	ObekE4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAx0-0000000EdPM-0N2R;
	Mon, 15 Jun 2026 17:18:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAww-0000000EdP0-3QxC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781543893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZr+ycgvZUilxhhoW/bzv6nOUngq3yd4joV7dFf5q7I=;
	b=fzKrMH0uSAB2f1PpaZ4TBn8r51WZVmBx8LdHm7kcQT9C+bX3YySpIHloJNiGReMspV5Pc/
	Ren0VzeDh2voMvaQ937AfKjHbH5QmleLdWIYbSLlysyURlMbgZWdHEY5PBQ/OQMAb2LvzU
	JjH7bxP6ZNjZZ+J0UbS33T8tVK/rKcE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-_mrISCGqNl-SjH1TQnZ0sw-1; Mon, 15 Jun 2026 13:18:10 -0400
X-MC-Unique: _mrISCGqNl-SjH1TQnZ0sw-1
X-Mimecast-MFC-AGG-ID: _mrISCGqNl-SjH1TQnZ0sw_1781543889
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so47302941cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781543889; x=1782148689;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZr+ycgvZUilxhhoW/bzv6nOUngq3yd4joV7dFf5q7I=;
        b=sKEkHFutP0lRkrNJoHH53y0S+uVfKo71HceeKs1Ea2iaNL8wiIVekd8QTaM73eGvKp
         sEpmlIP8un6hi5HfplEzXQNM3AIaDwp8J29aCqerYtqNqj6uTzEFSuGybFTr1YdSQCu3
         at8J+zZQ4vpD1eDRg/dKWHHvLgW4Fw2MkSAV2bQWNI3iGgw7NXYv1UnlXgNXMWSYhZFE
         iJT+9xb0gaBsKNUUHTcohoWUucaxihJNKXFSd142bpNHahQ+y8WMPs/P8gm6CIZnTy/4
         Q4Ma9F4zfxwqOrgt04TYrez0+coSHUuIv+JVqkgVHIz8bZmvr0M4KRK8Tp5WZa7qznY/
         KPVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+Ywu+EeUzqecfl8N6rW2NOOb2qr3xqgepPY9hrUPdX1rGzIHme1H/ScvDuc18DHfgjpUuHAppmej8FoFzV5y1@lists.infradead.org
X-Gm-Message-State: AOJu0YxtJ5ysYIhgj7AgiFvUaUzDPtL9KDv/GlSjaou/0rKvk03o1VeH
	Dfxo4wbJSR+ypmjZ8sF3YaSLXN7H477gQOJUd/XztRe5Ck8pnNysPJSYI/NS2UBkw5fKtGEEU8L
	IngvHoVjNjB5XYMu3c/pA9xz+YEQgw3iN2+cEFA8/Tx2KIhmoWGSIEwxj7NCVZEtGwvvWN2f4jG
	AA
X-Gm-Gg: Acq92OFTxtx6lRjLX0TdPmKVA6ffcunr8PMbK+CWXl89hsyeCg6NmyBvbSwaFGfXJ+5
	tGc2/yfya0m5snXRFuscY405wNGaMwooMAX4OFMKqxHdcwWqfefqV92ZQlghJe81unhtcUSYDGB
	1YjVNrkfNCWcF/E1FXNYAC67z1O/rMqv8s/SHyd0KIqsuyLG6zq+4p4IKyKoBpBAvfz0DN6qfz+
	jLFBUwOIxPwhb/aNrHWCu0e//ar/vZSYkYQ5ricLzmu99GLxq0aGyzUhsd9m2Ehns7pNgpwjkd7
	yrOVNfvFeW53rwLUkt4KFdH1HbuTO1kK13DNFIWWVABbxXgMz0aI8r9C7aja6louQJYyHar9C5z
	5c0C+HekKrpeAHzqRViXsOM8r15YMbUN8AgNa/QI17A5jV6MQ1P+sJyc9
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr224740481cf.16.1781543889174;
        Mon, 15 Jun 2026 10:18:09 -0700 (PDT)
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr224739901cf.16.1781543888617;
        Mon, 15 Jun 2026 10:18:08 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a2227sm111888521cf.16.2026.06.15.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:18:07 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:18:05 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <ajAzzZQijess8tZf@redhat.com>
References: <20260604025115.3763823-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260604025115.3763823-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jUnJo53W0PJ1YX7RHE4P8KY9hr75tt4Nd4E9n-4VLAw_1781543889
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_101815_106238_00AFBB74 
X-CRM114-Status: GOOD (  15.51  )
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

On Thu, Jun 04, 2026 at 02:51:15AM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Add the missing clk_put() after the name has been extracted and
> before returning on error to fix the leak.
> 
> Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

This calls:

                parent = of_clk_get(np, cluster_index);
                if (IS_ERR(parent)) {
			...
                }
                parent_name =  __clk_get_name(parent);

Can this all be replaced with a call to of_clk_get_parent_name() ?

Brian


