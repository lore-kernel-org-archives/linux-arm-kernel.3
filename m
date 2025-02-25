Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259CEC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFFVttm850UqVz1pmb+AlnJQK6y1OGWuLBvoqE/ivD0=; b=f8eiPD7JCNK5Clpaq+qXR5gVTn
	/6ozPERRaJW8jxAzKoYrRUvySQ9T9xCJBQBTarApHLSo9fS+dWgyGNXOaM8tNI1QLlriNiT4TGOSZ
	O7dl+NSmHhTPznFlnaEA8jgleYRGIl51ToBYvG6XHAVJYvr3mOg288lALjcCf/DRFEKK4rTA4AfE1
	Ks3cICBc6pt9nBEgCoyE59P8xcSouqcL0fVeMGplWqIrCXGYOr9HRqvZ6jHtQE8A8prSLtUeLi/sA
	n2pvYWERfzNwxV1+X07XEIa57SjgUEAsG/fUp33gFeXeZ6iWcEwzKd8v+akA8K/6oehxGlw9II+Qp
	y2o1keGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxya-00000000IH9-3s0q;
	Tue, 25 Feb 2025 16:40:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvoU-0000000HVu9-2OH3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740493293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFFVttm850UqVz1pmb+AlnJQK6y1OGWuLBvoqE/ivD0=;
	b=dV+gF3aBJG2ObjJtIOteRp5o4ZeAAdcEKWswESee9ZMQmGHBUaahzzAvaGbeDOp5nEvgMS
	yxigvz2BdKIrv3feZK9uw/ziY+BM2BRNPAMbzrRQzSoNbao8v6JweV1l/2DhQ6xb2pjIi7
	JzGOCritUGnPMlHVwgTaJeMHu1uAWP4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-NoBz_ALUN8e4I_ke8oBYSg-1; Tue, 25 Feb 2025 09:21:31 -0500
X-MC-Unique: NoBz_ALUN8e4I_ke8oBYSg-1
X-Mimecast-MFC-AGG-ID: NoBz_ALUN8e4I_ke8oBYSg_1740493290
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f29b4d4adso2317848f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493290; x=1741098090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFFVttm850UqVz1pmb+AlnJQK6y1OGWuLBvoqE/ivD0=;
        b=Cvpy7yOyoC+4HQEpPYQey6I6JvUqzlHF4fRgehq2Q7opN/2ANFtw3OY1sKg3AByIbS
         2bZgbnY5x3ZVulD5jC7Bwt0zpfIWbjvbeQbXF920sDgkhtgyXYf84gPph9aEx7xIycOE
         zCyA++DCjgWTQUOu0L0GDHTv/GYscctHgIxPWx7Vvj4lzBV5qCqre1iSlCk9luDiWsTf
         /uYH1RUh1rlCD0woqhtg/ROFcdU/VV266T3Ya9jHUdUV48zWca4oDyKnV8/Uub3SeMoW
         NLZWmXLDTXRfaqkC4nMG5x8HnbILRcSbA69ovRmize+zbEOmNgz/yw+nX4JhdN2/PZ+y
         vKEw==
X-Forwarded-Encrypted: i=1; AJvYcCWDu1JvrjNyLZSEvZ9jNXRezAMVHPvceP9edJhCvQObkc6kn2v3gq5aauis/4+07BAy8AapNslgbXroCsjyh6D5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Stpm8mJoEMKkxiGp8kRTOTYUdkaJ8yKMT/THfnHnmWVRQUd+
	rjukE5+ek/kxhGNgKcO79nCVMjszd3ZkGcj9zyYaNUnVauzbKzdV2WkdeC1JRnnwaCzk18tw/tX
	oA8y9jao5yHzZT0JbpZpFdsCjTnlKeE5m/QbMNwIDPfRRdd9LYx9ul1C77AZ6Mt8Ql0zDwMkA
X-Gm-Gg: ASbGncubYhqbF/uYzW4lVP1gqhfQXZT5PI1rv9k3N36B5WC7YdsGcNQc811C9dkeS/N
	ukss1zdDcNqdEOF5jTzcI+HgU/I57DM4f2FTEnOETv8vcteQITwFlBcrePnMQItDtXu49O4KHh5
	V8eYjnLbU++2T3D4Wd9eT6E8BhFrmXAX7BrteuHsiAxnNiBZwJgnO24/6dGR+H4tMG3CXmn0M1o
	I0+lwac2PsjwgitIwWX0SJ4gKlSeU9e9FLVdn9AzkOjZgfHuuQEscGNW50JoKMRlrxrpylhxj/4
X-Received: by 2002:a05:6000:401e:b0:38f:210b:693f with SMTP id ffacd0b85a97d-38f6f0ae79cmr12378085f8f.52.1740493290281;
        Tue, 25 Feb 2025 06:21:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPzWsgH9v1k2HVPYkFXNJ3hhFz69OOLf5Yi+p9svSln8YhJs1OVyxaR00ASzjgQujycgWCZQ==
X-Received: by 2002:a05:6000:401e:b0:38f:210b:693f with SMTP id ffacd0b85a97d-38f6f0ae79cmr12378040f8f.52.1740493289721;
        Tue, 25 Feb 2025 06:21:29 -0800 (PST)
Received: from redhat.com ([2.52.7.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86cb08sm2423039f8f.29.2025.02.25.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:21:29 -0800 (PST)
Date: Tue, 25 Feb 2025 09:21:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: Peter Hilber <quic_philber@quicinc.com>,
	Jason Wang <jasowang@redhat.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, virtio-dev@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] virtio_rtc: Add PTP clocks
Message-ID: <20250225092115-mutt-send-email-mst@kernel.org>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250219193306.1045-3-quic_philber@quicinc.com>
 <20250224175618.GG1615191@kernel.org>
 <vhlhes7wepjrtfo6qsnw5tmtvw6pdt2tfi4woqdejlit5ruczj@4cs2yvffhx74>
 <20250225141240.GW1615191@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250225141240.GW1615191@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4PYfCotPUXUMASczhtSAZugbEabJuS-QspOZAdBmnVs_1740493290
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_062134_681130_C4750856 
X-CRM114-Status: GOOD (  21.31  )
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

On Tue, Feb 25, 2025 at 02:12:40PM +0000, Simon Horman wrote:
> On Tue, Feb 25, 2025 at 12:28:24PM +0100, Peter Hilber wrote:
> > On Mon, Feb 24, 2025 at 05:56:18PM +0000, Simon Horman wrote:
> > > On Wed, Feb 19, 2025 at 08:32:57PM +0100, Peter Hilber wrote:
> > > 
> > > ...
> > > 
> > > > +/**
> > > > + * viortc_ptp_gettimex64() - PTP clock gettimex64 op
> > > > + *
> > > 
> > > Hi Peter,
> > > 
> > > Tooling recognises this as a kernel doc, and complains
> > > that there is no documentation present for the function's
> > > parameters: ptp, ts, and sts.
> > > 
> > > Flagged by W=1 builds.
> > > 
> > 
> > Thanks, I will change the offending documentation to non kernel-doc. I
> > was not aware that these warnings are always considered a problem.
> 
> Likewise, thanks.
> 
> I guess it depends on the subsystem. And perhaps this is fine for virtio.
> But for Networking at large the rule of thumb is not to add new warnings.

Nope.


