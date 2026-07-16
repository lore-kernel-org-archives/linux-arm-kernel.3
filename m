Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A051C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrJkb28g5vCOjunGV7ewvnFrjPjFdF0Thp9Awt+P8b4=; b=YfcnbAu+6/nNIO7gkxbWbc4YWi
	gt7Ahm8bdeWfqtaqMdTgKxlwnhLW6hhA+ySKtOamhUnp0C62CEFDzdmKmbIyCJ85wWwQf60q+W8Oh
	lnh2rIYRXdyqvZG4jTupY4XTy7T4BmxAePe9Oftg1BTbnyhxsAPo8XnIRRPT3T/DMzkQ+4aTMGVV4
	rwZEFYiyCfNZ1zvMx8dNlA6O13fAikL6hUEF6alrla0Kj1r1LNLTH3XSdhkSOPlZ6kmZ62ryoeVMO
	UR/mrm0gHeiWWQXIivsqQ8nkB1qfAjSB5Xqo3FZctSDcwOAJtzftBrc1sTQXYBL+aTIFkoNfUprgJ
	usX2onHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN4z-0000000HUlD-06yH;
	Thu, 16 Jul 2026 14:28:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN4w-0000000HUkA-0zE4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784212125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrJkb28g5vCOjunGV7ewvnFrjPjFdF0Thp9Awt+P8b4=;
	b=Gv7Zl9A4S4lCn2jmC/Ek3aRdbDRsofYdMJGoG1WIygTNQvjQcH7WCwUseCj/kHYN0W4PLc
	okjpoEljyYIWkF0d9oTMpilnOCnpHaaLjHsHA4h6LGX/YYCzhD7pVB07xVjfezdnZXrnuM
	8klLivowIVg3MIkSMJCqlNgxSF6bP1k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-QN8-d5V3PMGWBLqnasGODw-1; Thu, 16 Jul 2026 10:28:41 -0400
X-MC-Unique: QN8-d5V3PMGWBLqnasGODw-1
X-Mimecast-MFC-AGG-ID: QN8-d5V3PMGWBLqnasGODw_1784212121
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so72143671cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212121; x=1784816921;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrJkb28g5vCOjunGV7ewvnFrjPjFdF0Thp9Awt+P8b4=;
        b=Ka6nesD0fBefSKysRCxWtqNxVh4jepm5PxeECahsVt7puVvRr+4yOrk1vDdX9wLSey
         E4RcawImGihfN8tG2tDbm4FMN5pHkz/veu/u25V4ll0c04DLC6bqFdwOT3bBoNtcGe4X
         KnCfETTpHFfmAP38Czuw5Be88FsVUCRgd6MyfnpG2M8FOCHTVWoe3Lyb0DT2mmQGuECY
         qTrLzdyQ7wmpno5et3br2xZmC5xGAm0uMr8PZPs+X3ejDGQbX68e+uU59vdnCOs8q7h5
         AaCzFXOVzdWYoax+em0TJGeRL3Y8ZwT4kCc2CLacw55Suhi0bl6VDxlwlpkJoVcub79Z
         HTKg==
X-Forwarded-Encrypted: i=1; AHgh+Rqrre+OOhdxgNtOevbK1bFcTCPZZhP+hqWb1wPjzC575dpdLXlJkF9U4pOgnOsAynqsKqqtjctmf9sk7RqMiQQJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlSFjbdJj89HiMYSUnRCFGaTrOkR4GhOsThS/eayyEYTZ2fxca
	u1FQPqm+RXq8jCpog7UXruUyv1pbX3USEkbz3+h1xRP8Wz9MHOjgw9gLDuCWr9l8dMG/hOaVEwL
	tpEBfWOV6Gt/XKwPHoWjrdca2Gn/QFqI28qokIfsTynEB7hp6LD25ZCZcqyPS4ljqCW3s8QeJD8
	OGMD+5uDu7
X-Gm-Gg: AfdE7clikkZH96wrhw3yV96pjlXN5pkOPDjPU/0mIrfvmna87epJzw4a/bVCSsLxc5E
	RnFTAPVEQcR4Fh9/ZBa9sipDQkgAQGEeLcM+zNaaN22Ni1v6QORNXt6YpKfhLywVWP/yZT7N3wv
	GB/t2hz4CTT4JfSHRxDN3miWz6bop1p5T+zyVBoW19ljsCPQ6iaY1eW06WRJP6flmGJy6M/NxPk
	mT6NhoSpcsM7phwEC7K4lnTyWaJJx6dnKTtdlwpXHEY5kXkQODSrRb5E7duBBm4m7TKmCG8+4cO
	3rNWvrBf1PqAzldVeIRxJK934se9oYAVko2i0mrQ/DFwqNxvdkIsuan5GtxKn1qX4DQ1f5E=
X-Received: by 2002:a05:622a:130e:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51e42352605mr118459741cf.9.1784212121088;
        Thu, 16 Jul 2026 07:28:41 -0700 (PDT)
X-Received: by 2002:a05:622a:130e:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51e42352605mr118459391cf.9.1784212120531;
        Thu, 16 Jul 2026 07:28:40 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6e326sm159020491cf.6.2026.07.16.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:28:39 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:28:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: duje@dujemihanovic.xyz, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mmp: pxa1908-apbcp: Remove unneeded semicolon
Message-ID: <aljql5MD-nvgqX4T@redhat.com>
References: <20260714053059.3219704-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260714053059.3219704-1-nichen@iscas.ac.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1HBRGpjvvkXDWvDVKi_ioUwmOcnKzfpQZpZx68eNoOQ_1784212121
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_072846_352828_DFAA2351 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, Jul 14, 2026 at 01:30:59PM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>


