Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CD8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=; b=EuTm5nU+04FVM9C2d20SZdQ/tD
	IuLpV181++BYJuSorLP+LdLgcBE7/oa1fK7zW8FeM+QYCTJeWO+tKEWdMDp45Y46xrwbYebt3lt4M
	F9CscTINZxhFH9fJY+PuMV+WhjHYQXrR6PuBI0IxUNnX7YQRHkQAVwf3pLOyxZ9D+hkWN8OUOmwCA
	IerKbPmV+qwNyY2EeGaCN7jAsP+Q7SOLT4aI/qLa638CjxzIiemZeXVQNle1exyMWJM67VFKZimIj
	70uPJ+VaGzkOwr9hQU1INkPjC5NBxV7q717UcC+SrhkCGPd0ZxbJ8XDpRYjQ9DlkLqcP+T+Osotvn
	bjxDfkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMJ-0000000CtyZ-0xUk;
	Mon, 06 Jul 2026 15:35:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMH-0000000Ctwj-0nL6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=;
	b=VDlxitduT2hpoPuDSXDMhTDQPkpLQ9il7p2jxYaSclKrruGjbCOmlXW+l6Srjt0JCi/c9t
	Zv2S2DZldkDD2Gz4lNBWmFSGIuSNBqxszL76Hefi6e1PhVql7bdrMO89YtINs2QK6RztHM
	kjiQrh8KVsy6ANrvn3QzIpqtR1aiECE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-qJ5gKWggOoaCswJfUKhI2w-1; Mon, 06 Jul 2026 11:35:42 -0400
X-MC-Unique: qJ5gKWggOoaCswJfUKhI2w-1
X-Mimecast-MFC-AGG-ID: qJ5gKWggOoaCswJfUKhI2w_1783352141
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80e910ddbc6so91746027b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352141; x=1783956941;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=;
        b=BudaFBTBbgLCthmCmRVIj/iZuAiPE6sYDDFxc8Z8FuDlIFWh6ayChX/nbijNk7v+Ho
         eOXUeADiDG6BMMtZHF9rNxknRlBie5So/rFfV7nmrzXu8AOkCIZHpzHEyFOq9G0J7qus
         G1xdl67CBqqJGmLdEk9mLvczYDm5xlWzb4ADv2EjDvjW76SGQCHvJkxYJHRoby7Y6dqx
         oCcNEIlBcKR6rQC3Z/ytBpA+MqIqchM8jZBE6lLMvWyZ5XX7ELax73J3XeAuNsPNgYm/
         GpM6FFcHf6OiL50yTxvHurH9+9F170uxQJIFK7tqQHCJNkwTU74/5jlmHdlsF2krKPpI
         wvYw==
X-Forwarded-Encrypted: i=1; AHgh+RoNZr0/9oHd9zIvr49ohGdX8oR5YZSV1ESIzn+n9rOGuy2Z6NTdHTU1dE5/0hfbfpBfIqBLUDIeOaEDSLvwk0+K@lists.infradead.org
X-Gm-Message-State: AOJu0YymZzsq80Gm3VA1vSrIK8srLopFS+MF+KQyV850N/sBkha24vh1
	kmJ4H8zSvKRBNvxyzVn1G7iE2LH1+59T+JZBM5RqeLlV2AiMAhUuKu+rBVpxOcQ3Yz+oQtY4Pwp
	PfO0nxIJASjAznl2zgDqncInFleIGwv3BZhUVStOFK8h6028OndqVmH+T1/wLOXj0p9Qbeb/LON
	zf
X-Gm-Gg: AfdE7clRvxVQlXd2OFkY2LkiuCmJgzrHwDb/1QLoFCveOo4zijewlj0SCr0fKe5h6ZC
	YVxy3AqQ0gQvne83SEct+8bh5LDIykwv9JlLJr8j5FiV1kjy+gSXJsJUTKJdso4rKt0+T+tKW7v
	+H7VODGurz01XQCDXHylq1kValTzDlkmNMbbrOjL0FkYGWIn3dsxsDaotqz0XMh434Yk6gTz5YK
	g8uqQI2SXXUrLyn2AWbw/ok+bC0mOFO+boGRLwE7BGCDU2+RNoQUJ5AkNj6VwLjVLBg2TFVUh0K
	76syzNKLbwujnsF9spa4dLlWNo1Yp8eU96U2NuHIbAAASdEktO4t3y+vFkPMXMG3AnxB82/3twC
	A0YxxryoHspB7HhMvr2Q+bLzYKs7xT8kSsOv8TTeC/aomZw==
X-Received: by 2002:a05:690c:3601:b0:80c:85e5:8759 with SMTP id 00721157ae682-81be38b8fe5mr5792587b3.66.1783352140784;
        Mon, 06 Jul 2026 08:35:40 -0700 (PDT)
X-Received: by 2002:a05:690c:3601:b0:80c:85e5:8759 with SMTP id 00721157ae682-81be38b8fe5mr5792387b3.66.1783352140419;
        Mon, 06 Jul 2026 08:35:40 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783fa21sm58952937b3.2.2026.07.06.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:35:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:35:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: mt6735-vdecsys: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <akvLSe4WOXpxgbO3@redhat.com>
References: <20260704124450.11035-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260704124450.11035-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: juHf9MR-tPnee0xy6h2sAHCX8-BmnhHCTgbq8N-kuls_1783352141
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083545_313260_5AA0EF1C 
X-CRM114-Status: GOOD (  12.49  )
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

On Sat, Jul 04, 2026 at 08:44:50PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>


