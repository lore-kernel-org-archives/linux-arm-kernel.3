Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB31C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 03:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=; b=fGfiJ2MVNJ+yTvniSyqnxU4KBj
	ZgGx/OVlUg09N2OL8d4nsaPRx1Zn8RJOoGV/+drDnBHtjIT0zoh6BUWsckJ0kGGVnwndjG6LaPB19
	rPlSz6DbZElHHU8JQhF6j60ulpki+7HdNn1/xXk8yw8VbXPCQTTeaxF6dKgbLt2+zdJisz17l9RjV
	mbbxsFxJRGKnikItYW1Ml5MTy+GzaKzfUBDW6OUfBALQRRVjOtaeuNnpdHnI0zyNkIGpJQrG518Bq
	OVDWbfAipZ227Vm6jFmaYIX6igS21skfqKpaLfUWvqVnXIF2D2cYPpwU3BhPFw3Lt69rDvt6kDlJk
	XMJlFW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UkZ-00000000lXl-2wsV;
	Mon, 21 Sep 2026 03:31:27 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UkW-00000000lX5-2wWF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 03:31:26 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so2953686a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 20:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789961482; cv=none;
        d=google.com; s=arc-20260327;
        b=U0kIEfzXJOGq81shMhNplxYkIOuMRtHgbvxUV3YENRTp+OWtqIouYrpNe0t+FRZ7Rt
         fRmPGHgcdk24fyLhGnf9+d/X7Sjd7qMrUusZ+ECOTxrDYHDxfeNQBWGQoaKKVeQlnrl+
         UcxVYxXHdAfjB7E+8ZTrzSCFywQZmQE8utZQnvQXEf4CIKiNgOkPa83Iug1v9hlDOzIc
         R5fQJDuXnzbocZl+0fz8DJ2c8q1fQ+yxo+jhmycjPZ1f5epclrCG96RxEdmaQjJa5/M7
         n8y9rOhdoPrqBNnpOlsq8tOL14/7U2Xy4HjfnW9dU4xHlW4Y3Wb/U9SbETawq8r6xgJO
         TG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        fh=HN98Q1chsb5CkkTZtUqhARFsiyymnGQMVliZbb1SZ1k=;
        b=WlvXSyG3x19bjRNvuxNGsi/cC7DQ8D7yUmwvCjSlOefJFWvTLJKiV6+VXPgSrKZVel
         qzCG+si3xxIU0mF4F+KazlYzLg2O6fsk6wNfpauTPt1ofBm+DaxPNmJkkRrBakHpxuvX
         2cLCEZiYaUEeGZV7ikjsJxrfcWprZqliDz2wDhbY3zg0WguIe8cqoeFs81HtOZGFi933
         lFMJT8wcQ9XC2C3/s7wmjqTpiYUugQdZBRUdZVietvOabxyZ+L2/g+M3BTG+K2AFSzzA
         LACP2cUVaiElbuHp/SIjsHpoWGrb2jZllyI/dJ778dKVDv45RT2Iay6+e/XmX19SLkmT
         UMiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789961482; x=1790566282; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=AAKfcpCJUkrIj6mYWHuadxY81b0/NRIShY7guHwWgPM/JZ0Uxvi+3HsjYNqgD5i5QT
         yQyKoEEg387Y/VrzKVwX/8BGLTdICmcc0ca5TVlklW919M+fPe2xO4bXVEHNYGcndiG/
         AyoV2m1jhIIwPRRwTxvQdEPTdxby+1JCaFer4yb+V67h45lKghuqf4cONOKWdgohSQud
         cZbaP3QYWbewA9uxXdMrmOzu1WWB25cJTfu50DwRsP2+/4P9bjlnAt81rTinrIllRTuT
         Gf7oVx0gMv7E6BxNHQjEaQQGl5DlVNsG/p/cyqxJhKjNWG13Za2nDuCZq0Ir4s1JjFZp
         viBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961482; x=1790566282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=RRxCR19PRqEDxLw0bejAK4sO6kGReeAY3xO4uQt/p37nuWVoc0gBBuISS99hgttc1j
         AMqlQCuropbLwrrCvVsp92bi0TWzqK6XDxQD2052kOBifPY765eczeGkf79RgjuMySqu
         gzDXlXQRrwjDSQAzio2QX9oDL2k9F8P+YsWscT96hBjhTxlfhx5u1WmabOmTKLU34/RO
         BIjx09cEhGrGuNJfXwuKRVhOFruwb7LOSYPxvbSWC/xaodXDzhl9uUKScHqXw1w+3cU7
         cx3vLdRfwqNsD1UCdii44eoJMLA3SAwTLr+jfMjS6pTLXwCdxoINvjA2O20Yokgvdz3w
         2Bbw==
X-Forwarded-Encrypted: i=1; AKwUvByC25Ck/mPI22cEdCX9sOBf4q428SKIf5gP0+DzpmOz7txNelBGc7+YJxrW7LVJqkppA2bncTcRW5HGkssnf7ku@lists.infradead.org
X-Gm-Message-State: AFuF++myXzIHUwRxL3PE7dCZAqlLCn2IxR4x29dZ1H4jA792omuyYW4i
	5b5STUN9hg9QuEayQAQed2xqS0dE+LlpSAxgmr22zGJWlZh+zQIt4aeQR//jpJ8m8pGveuNMs1p
	bJaFImHp/6k1mj74HXIfoaTGFmUuh6F4WD2b+XIGPnQ==
X-Gm-Gg: AYBFou2G8jv0OYYc9bP5okx+LoPAKNskQj8ZwC+pB/BFa10sdnykaw2/uICC470LCkm
	HOesdGL038S5KCe/K3d06qQlTKtRwCD3JJOJzPwnKY+Z/RE9diBYPtdR5EoUvF1lMUAhUtGKYhj
	9xv9yZF9vXAMeaSs5CmUrDreUVvLO/Ji1mxwz94WzVtlESvWIXOUtskcQLptedrBBOuQicOFtoL
	a1FEOvqF7izT+9tdR84O9wKI9JyfRRiqKtezi77w/QpVTuZS2RkPalu35eRfGETqzTY/hyF8VJQ
	1uv5WQ0TG3jxiYyrjmUZe6Qo64dhypsN/iUgez6vdHQb4mZLUr7d3paemWdjpc4q8C/Nx212oUF
	IbW/WOmkd2jl44Q==
X-Received: by 2002:a05:6402:4394:b0:6a9:ab7f:c8f with SMTP id
 4fb4d7f45d1cf-6aa54611e57mr5885453a12.17.1789961481999; Sun, 20 Sep 2026
 20:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater>
In-Reply-To: <aq453yukMHiNb1jp@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sun, 20 Sep 2026 21:31:11 -0600
X-Gm-Features: AcwNN1W3qE53RFtHuPGOztjJSdwljZIvy9Wk3z8AN3NJ17iDKQARaTMy5b-3hH0
Message-ID: <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_203124_785653_1078718B 
X-CRM114-Status: GOOD (  15.16  )
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

On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
>
> Hi Mathieu,
>
> On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > Hi Francesco,
> >
> > I have started reviewing this set but given the size and implications, it will
> > take me a few days to get through.
>
> I'm going through the review done by sashiko - would you prefer me
> sending a v2 with the trivial errors already ironed out before doing
> a complete review?
>

We can wait if the errors are trivial.

> >
> > Thanks,
> > Mathieu
> >
>
> Thank you!
>
> Regards,
> Francesco
>

