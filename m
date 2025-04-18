Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C3EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=; b=X4N4zLfjczLLFYJewALCc041Fk
	XATknoj+CKNDicIc+cPZANdFfaVtRf5Xt/BNXSdX+Fj4cYWl8cgstxwqrCKgLKo/a8YhuS7TZpqBQ
	F7Ec01VF3hangDaAMSEDR9GZQJoHcNmBdKBzE0qSZWcxuYsVGV4K+JYUn8aU9M5Sl2kZ5KsUeBqeE
	8wPRp9KeBqxnxBCJ9SnFUTmt3QPx1qoL63iB4Ca4AuEzoZ75xO+APTNZwHkvJY9JfYkznhc+daD/C
	tWCJ5jvnntvTxFkR7PvjffcHih8pq+/kpUfDKW9yJU0Ga6ZHD61jJaRkroMHAUemQNTIZ9MKhahQe
	y+jsz+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nsA-0000000GlvZ-3deg;
	Fri, 18 Apr 2025 15:43:22 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nqE-0000000GlQQ-3HIB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 15:41:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5edc468a7daso301151a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990881; x=1745595681; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=;
        b=LUg5voakiiC5GUNr9uw8SoRqUHG0NCW2LbOQqSrOYlUUhzNLanYOXoQYcLcVyyX4Sq
         hBXmfHwhKpSlCG3InFe9McXjeQ1I0AwFo6H0SKkxHQ2iH8+1ylkRzktoa9L6zTIL2iTx
         c/DzwSu3BEAqpqtv4kB5B3WANYRbN6MkVfNQJ4E8q7G/AfszgUAAHtHGNQXUs0DMyh6R
         GYRBq20ivbBPUZPdDMvSGNG+2+1a5b1a1OZFKrKwGRtz3mBwPc6IVycpboZW7lbc1U+5
         M2g8Vkx3AfIXQf0QSI0rv31jW+IixjVsaCamoHtpVvX1o+yiblThrdhPjPssdoJQc+DW
         X2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990881; x=1745595681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=;
        b=CVF4MZfHCVII/ije8QmKjg/vSjKM98nIQbnPNxoSD4wU2a1vzmeBM1wImlAv/6JSrY
         LbifBkXY88+r7Ym7SUf4uMfVmLiqSU6Ly+CB7SgdMa2i2aCJW7CeQHmiwCvpJwQdc/QI
         Ai0gUKCocHQveaD0Rr7yDL/tfyKPVnNSeWAaN12JJn54XcX8Z5JYdt7oO2Xamqsfhaun
         2UPU54KYxRsuC0hLtl44OYWJzp3t4cV2t3aE4htut2g62TmICblNzCn6yMbRi8i/vYkn
         br04fS9FAZIkwob6Ayb6NzK7OAZ4SL0TQsyEUKq/8xFYwys6rsiYQSJ/oD4XdyYKbWzY
         6n7w==
X-Forwarded-Encrypted: i=1; AJvYcCXOfgyrObDunIxF34xrkTIAoCNrQ/G8OrU7KubK3RIt56fi9VUtBLA9J2WVjkveHDUuLCVBHRZ69qgB5leV4Z+7@lists.infradead.org
X-Gm-Message-State: AOJu0YxN/U5Wyxl6UD68i4/ty4P4GNJigQaCVKBh3F6HQaK46a5EXRVH
	7PtnX5FKLNb3gQcVUmnll6YKYYJVhVnEd7YUQiMxyLl39YMotDjc
X-Gm-Gg: ASbGncvP/FJY/J6UBi3mgq9jpj0iF8WG2Ibfir9cv+qq9YXSphPvK1S3b1bpVAkbYtJ
	outWSHsloZcmAL7JNAWFNr9pjWwMZgm7bu5Om/v8YCD2ql2IHYrqzd8BFp0UOxQqK7znNSqIxTY
	QC+R1tgnbwydh5967xXUBigzbTrFbnKKPFOyqEZL5BQooP8WnPdE3MqU4KImE80J9WySgNNmCTJ
	YGVEXjeehL+JLL8cDHpYBjfQ64SjvWuFoQFOJfu309S0AUV82pPPBRni0ruygaXbBigLk6Jl4JH
	IySj1B3FI+7L/lNoalRpel8fSR30
X-Google-Smtp-Source: AGHT+IEkRAOdwHdMRa6d2QlCY5Yrw6uQ9t0434Mw1NfnH0yIfWXjkcyamqR6CUsapH+iG9W1uhu/lw==
X-Received: by 2002:a05:6402:4301:b0:5f4:ca86:916c with SMTP id 4fb4d7f45d1cf-5f628524a18mr946596a12.3.1744990880873;
        Fri, 18 Apr 2025 08:41:20 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625595590sm1128785a12.41.2025.04.18.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:41:19 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:41:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250418154117.jcd6xxnwot4nmhek@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-5-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-5-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_084122_820279_EAA7600D 
X-CRM114-Status: GOOD (  17.09  )
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

On Fri, Apr 11, 2025 at 05:57:42PM +0800, Wei Fang wrote:
>  static const struct enetc_pf_ops enetc4_pf_ops = {
>  	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
>  	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
> @@ -303,12 +489,55 @@ static void enetc4_pf_free(struct enetc_pf *pf)
>  	enetc4_free_ntmp_user(pf->si);
>  }
>  
> +static void enetc4_psi_do_set_rx_mode(struct work_struct *work)
> +{
> +	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
> +	struct enetc_pf *pf = enetc_si_priv(si);
> +	struct net_device *ndev = si->ndev;
> +	struct enetc_hw *hw = &si->hw;
> +	bool uc_promisc = false;
> +	bool mc_promisc = false;
> +	int type = 0;
> +
> +	if (ndev->flags & IFF_PROMISC) {
> +		uc_promisc = true;
> +		mc_promisc = true;
> +	} else if (ndev->flags & IFF_ALLMULTI) {

enetc4_psi_do_set_rx_mode() runs unlocked relative to changes made
to ndev->flags, so could you at least read it just once to avoid
inconsistencies?

Speaking of running unlocked: if I'm not mistaken, this code design
might lose consecutive updates to ndev->flags, as well as to the address
lists, if queue_work() is executed while si->rx_mode_task is still
running. There is a difference between statically allocating and
continuously queuing the same work item, vs allocating one work item
per each ndo_set_rx_mode() call.

In practice it might be hard to trigger an actual issue, because the
call sites serialize under rtnl_lock() which is so bulky that
si->rx_mode_task should have time to finish by the time ndo_set_rx_mode()
has a chance to be called again.

I can't tell you exactly how, but my gut feeling is that the combination
of these 2 things is going to be problematic.

