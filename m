Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0A9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 00:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=; b=luY7/FvvtZznedHMVbddPYNPQK
	y2bO5M3ByMM0BTB3RIqDa9CfjVLRuUAhlTQSvLIgAvIfh9ygwQedQQbL8hNKCjipeJ1gWh8xGrDrS
	UqX9F2ebiWHWwIWcnRTYzRAq6J7xFyJ+NO9lO0BUGcUW+sGHrqnQ7FHq+x0QCyKxv3iT5E7bzZKT2
	zAWhiJSrAA1yUax1jinYZ25HdUraifdtuyv7zz4Vwp1UoVkMpcl8jxBtE2VRt9vwqSHcuYvrgTEc0
	CBPpiJAqxnqgm84i50VoEffZo9P6aL0yoH4+KB9a+hz8v9II36oYNwdn/zXBQxXz13C7+nd1EtAFk
	9glzBJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BIQ-00000000QOI-12HO;
	Sat, 12 Sep 2026 00:08:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BIM-00000000QMQ-0rEP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 00:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789171716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=;
	b=elV+dIfemIKru/EmhPuiJ5LjyutSfy59qYseNQbF5IksBV0zzEbTexAR4P8p2n0g14cTYm
	vmZvRHqpL9/AGaDeXXjI7lW0L/8wKB/5+va2jqCV5j9K4ZCb14WtvuMynQSrN23ivPFqgz
	xizZnh12eTR6m4zexJJmYr0pyTyTQ5M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-8u9VmawRMLCoTbEelyb38g-1; Fri, 11 Sep 2026 20:08:34 -0400
X-MC-Unique: 8u9VmawRMLCoTbEelyb38g-1
X-Mimecast-MFC-AGG-ID: 8u9VmawRMLCoTbEelyb38g_1789171714
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e87478402so32761526d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171714; x=1789776514;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=;
        b=bJwSIaxYEbWwnsc+shjlJT5cr/UhBY3SHoAkRHIsEdg3rl1CBHhJVgYVFu1wjNpG7+
         lVItjaKQMNvUvod9DmiYXCBPP05O+Ki4viPA0ZxxvtoeLQfuqHXxUdiDC6F0M8tEgnCo
         FHoeyrL9oCO19OpkYTP1aWs3nqs4w6W0TCiXbpP+zdx8Zf+BTQuZhTYND+snNXNXBxYj
         kVDDTyPgjdOhHLBM2fdJNuz0YWMLSuO6Do4r0JSaU6AUCU/d9nRmCMApmzHu49C+WTjI
         M0mechDY/pP5VBFtgkXPF/gd7DCK1D3V9UuthfgMYauscKZyzGgq9gx4qnOypNP3eTO0
         uV4g==
X-Forwarded-Encrypted: i=1; AKwUvBzlyUVhTZN8rpOD/ddDUqeICsCGn8TsgmZvp9m9sD7WihN/smmZFk5qbWi78q+TuteSyV3zrP17Vpoda30zpMBJ@lists.infradead.org
X-Gm-Message-State: AFuF++n/SmYC6xYstTbHyZSRdadeO1O3i2Mj9+Y1McC59TXPVzXC6DtK
	hxhWhplBf/p+0NTNXu1pKp0e8I08DonMI9SLlAIZfPiU3UVGT0hbUEYOv/V2ePcTS+cXOvoDIav
	Ti5HNFINTrpxSPieGgxsD9qqnYr6x++9DEQX0a7lF5Gb/rOTCUSPDEj2LulTnLxUn9e3PkPoNEM
	n1
X-Gm-Gg: AYBFou384PJN/888SwfTcs239m0bcn9GeX9jVRsfEIG2uv+OgiCEixeOWFREztHKKpQ
	9rbbG0wTQHYwzdcXwfICrHZwi6vWh0K9A1jNUHaxXZQbl0dBXv1fQM4SxS8RQXJ0sspIs7+qbgn
	rviJdd7Eu/jcuvPU+M9prbVGS4z8cz3y05tpbQl8THoJkqnxbM4An+SCUOD7EEs5nMWuUL0v3YJ
	U758tf17TE73XBeOQJx2z2qy+jb1G/kFDJiAxr3kQYzSfEs+tYhHLTzVZZyvJP0+sJsIjD+uIWD
	qZ9fYR2me8fwOpU2Q/zVQyjeyQ6e/h186G5Q0wWyfTPGFtqeGpThx5dPl+x1KS8/TeBxUu1/Ao+
	MXthTE/1OJdp23n6LqaBAV+PyKaz8GH5Po+E=
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr10925276d6.21.1789171709430;
        Fri, 11 Sep 2026 17:08:29 -0700 (PDT)
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr10924946d6.21.1789171708976;
        Fri, 11 Sep 2026 17:08:28 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f20367dsm32915306d6.6.2026.09.11.17.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:08:28 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:08:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
Message-ID: <aqSX-kUvYaixESxe@redhat.com>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com>
MIME-Version: 1.0
In-Reply-To: <20260905153234.133217-5-tanure@linux.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7j_qm3wiRp-R-FXih2ceEUQS2ekj4CXzN3_PMfQpzSM_1789171714
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_170838_311565_C5FFD9AD 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Lucas,

On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
> 
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
> This patch depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this patch, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.

This series should be merged together in one tree? Which tree? I can
provide an Acked-by if it should go through the mmc tree.

Brian


