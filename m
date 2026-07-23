Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6E7C531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=; b=u/jMg2k01pdEy2P8aLeQl6Qrvl
	ynUsQc0EJFdNqH6yktATddXXVMP7RNrbazoOENhpN6OX3yNLbutkYeCprXhcjOSUopmeEetVbWWQ5
	4QDOX7cakWoBX7z1GTMq51BXN/SsQPQ3nM1Fwbkvd4b5HjKoG8FlDOAvPk8yo0e+jhHcSJKEIXOE5
	cyRhpCHj3f2Z4twJJPLGripSsKzPf1MhWXDD2f+NtopBppPJ3/vlKRTHJYCaXkElOWGzXrJjooJRG
	DlqxRMoO15c+08DhhmDyIz+UKWUO2BZ6c8XMDOztvL3EdfsjUSJqTpp6dYru6aCZKO2m34BmbEKOr
	U56+tRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuyC-0000000EYZn-1pa6;
	Thu, 23 Jul 2026 15:04:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuy9-0000000EYZP-3EM5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784819056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
	b=V9Fl8MQ5Wn/+DHL9MOXGlYUmSkIRcIXdAWetBYk87444NqreTKvk+7M6fh7AOPcPTlYS7I
	+TlqIEXfY4Pmlh+mrr7yDymoUYcMA6t3Cmj+f6j4UxaWbWbwI3Rx7GHcZ6msv66uGNzwAm
	H1zsSVEnxYEEAfDAWnVbxWlC1/NH9V0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-Aq795i1uN-KOBrQuo9P4iw-1; Thu, 23 Jul 2026 11:04:15 -0400
X-MC-Unique: Aq795i1uN-KOBrQuo9P4iw-1
X-Mimecast-MFC-AGG-ID: Aq795i1uN-KOBrQuo9P4iw_1784819054
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so20921651cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819054; x=1785423854;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
        b=YELq8gW1BeDMoOCfWHpUQVCdEGnXE9GzQMQNHfXzM9RpGFrLF0qPgJMe4w+bcoAbSO
         OAS6CeNPbRc9acz7Cy6ShjoOVqPWYL89nuUTf4SNCr+b9ouzfGvTpaOls4an1eBAomUM
         SFMRX3Id/e1kuUWLTw6w0hjWYzmmfcCqeon1HK0ZCCCAVO6a57hMpIm+Tr38CnuHnaPX
         hnjANVDWcA11ia96MNc1DCY/tELV2KfBb/XYC2WNK6FNbStopYg0q/xWHU+xGOUVFHGX
         UGJ9acJ8nRALRe/LWBFVN6GP8AcZ2JXzQdCHK/iy07WV9KBnK8bOW4GG+g/6Hrqz0CRN
         K+8A==
X-Forwarded-Encrypted: i=1; AHgh+RraMscpuqpUHPtD4fweRzXkVo9qXv4d2Fy9E1Z867TNK2W6q9iWWagS34ncdCiQPY9lHtrNOXnTXuCoiNhqd/pW@lists.infradead.org
X-Gm-Message-State: AOJu0YwUp1gWu8w91jHzN2e5x+zoh5JT6X1fFM/65b8ptSBWHjybtHHu
	YnsXjf/5oCd5A2FqrTRshFgXRr6zFvcK67G3loRMDTTUBQSWwXdiCUvvGF8DsPx7QoQvXDinXWU
	WFuv8TNgMvrvbf3IF92znaiRFYO+apeu8c2JP6HP62GTDO0sGgHylw9N/YMDGfF7wtYkFgtPIuu
	CI
X-Gm-Gg: AR+sD13eKYQjmpkRKkyP1QiVKGpyyClYGRULdB/xE/x1t45u3jnmkG4satMm3r/1+PD
	8V9UloNoonK3PUa3p3TBR5gPjJskuMfl7O/CZrQ54S8AThgk9sUFZbbKcAbEgWsBGdBmo1pUCJw
	tq/IN4IXiNVuakki1gLoMP/uzZw18GwXnBqNWSDK7VxmnfHv6eveB0Sk7hyk2fdeezXFrnwjID/
	0ZbBoAks0YKB0KRIimPkSRGaQWtLKpjPVLGtYpJS0oOUYEKzcNpQ6Rtvn5rO1QFAslQHZGT8J4e
	4Yp4RfnWLBKL+d4LSxcjh+hWlALy5239G//HzV3eeQ0dVjv1ukFzmw6HXiIgsIKcTObFFXtbpb5
	lgUzEw70G/E94f37YUJ3O0gAlhB+sDYv3xck=
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32053721cf.88.1784819053805;
        Thu, 23 Jul 2026 08:04:13 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32053161cf.88.1784819053161;
        Thu, 23 Jul 2026 08:04:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d402cb05sm36676211cf.31.2026.07.23.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:04:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:04:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH net-next 1/7] clk: Add devm_clk_bulk_get_enable()
Message-ID: <amItaLCmjtmH8SRQ@redhat.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-2-suraj.gupta2@amd.com>
MIME-Version: 1.0
In-Reply-To: <20260723123838.125145-2-suraj.gupta2@amd.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a2mp_bQGlTE49OK6qxccKuquPXXGs4yqDwrbLZDIOig_1784819054
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_080417_920621_39028548 
X-CRM114-Status: GOOD (  13.86  )
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

On Thu, Jul 23, 2026 at 06:08:32PM +0530, Suraj Gupta wrote:
> devm_clk_bulk_get_optional_enable() gets, prepares and enables a set of
> clocks with device-managed cleanup, but treats every clock as optional:
> a missing clock is silently returned as NULL instead of failing.
> 
> Consumers that need a fixed set of mandatory clocks enabled for the
> lifetime of the device currently have to open-code devm_clk_bulk_get()
> followed by clk_bulk_prepare_enable(), which loses the managed disable on
> unbind, or fall back to per-clock devm_clk_get_enabled() calls.
> 
> Add devm_clk_bulk_get_enable() as the non-optional counterpart. The
> underlying __devm_clk_bulk_get_enable() helper already supports the
> required (optional = false) path, so only export a thin wrapper for it.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


