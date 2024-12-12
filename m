Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF78E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 03:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u+cvNWc5zWjt5DLusZyEvN/LBjWF4ZD3de+gwpyeIw=; b=EJW3hU9An0Jlge5fwQY/7BFGW9
	T2pO9x/IGLRN8dWRoKoUdql6s2YTBLSJqMWHpcQh1/lW0dScIdC7KiM7I0LuhZsDrcWr5JnN17bFN
	0Op42Rr0CJZq86YoaRC4femn7sRe+xwA5JWVddfzefVBJDWwuzT+EZeb/hVxVQcYcgj9CLGUZWgUk
	wemHLu3Q7eSonqXw/smivRpGfkeB6efjcC6OELh4rrqTpXDttrAfKpP/CNVui5Wj0VGNF4k2MUh01
	Nv4F1ES5rOF+S+LMQFrDeE5pqDYH7y6sRn1pRyeM9D35gSXMdECinGx0vAWU/PSiT26jvMVgXCslE
	k0jLt3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZfg-0000000Gndu-3l7D;
	Thu, 12 Dec 2024 03:15:24 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLYhN-0000000Gj1M-0TEx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 02:13:06 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7fd49d85f82so122187a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 18:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733969584; x=1734574384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u+cvNWc5zWjt5DLusZyEvN/LBjWF4ZD3de+gwpyeIw=;
        b=S50F2BzDZqs8mxrui9au6/bqc1CzLhF9qM1G2++xts72YtaovYTV6n4ZhEDXKzVoFh
         qt5s1ezbH8exgYYFFAwOSDFG4FozbVAsoxS9+9mqerWFK/5160k8MH4/ddwfMLqA3FuT
         A5qn13METe3oBButbaYcbEgOstehwB0pSLlpw8dPTyQZPLJJ0Y7WjBEHUHpUFFBFgD+p
         vVQdOr0iJgIFNkUBU7Y/tZ5v0j8R1oL3EU/imm+h6QUPuqSIG086OBMaaoMKYLIo/POg
         oaqq6506pJFPaOtmHf/5orX4P+tSY1RSx9OnTASHgYTk7uuFk917dyy6vFIxzyST0eD9
         Eatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733969584; x=1734574384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u+cvNWc5zWjt5DLusZyEvN/LBjWF4ZD3de+gwpyeIw=;
        b=X0FUF+TPGxn/r/VwieqGt8ATiJj0hLgh5kENdH60K+3dsjFmL/L8+1H1IjwCae9nk9
         /sAE8+EtNHkU5iP+tnlL8hr0TN//yy+2YXtu0rA5TUBHs2yeH843WiwZ6tTr/7ldm17v
         SmBCgD+OSl6mZteILV77frZioOLMdxMauNu+UFO0ZysHPRlL4t2MYUwqxIqawzGjgmGv
         +/wO1fNxodAbpYgXzz3dZX8aIZsGEn7wI0t4oxjm+xo6QAws0Of3rHOh6PZdmWZqCh1+
         r167gcSGGBt63Rv1HzTJYW4SohPYxR5Buzu89K2CeW8u22BWZ3fAcp0CgskQQb+q3AQH
         nC9A==
X-Forwarded-Encrypted: i=1; AJvYcCWvpjwQAkbC3ePnIdkEhbtKx7IpqIoEZFbqDEL1rII2U2b1EfGXwHDHje4DWxpen03tRHmKs3YVEBn7COWKt2gT@lists.infradead.org
X-Gm-Message-State: AOJu0YwnpXLg8zDnbcyApmL6w2r9U19rfaNmFee3sUheqpWUw9tSe+6r
	5Lxi9u4ksj+r0yNtVegKkU0Xg1b+uuHkOO7k1DXTJPefbBvwZBHSjTl6s3wuEwSN0yDSwMzIqD1
	XXMWw1pq626RgrsjaJJIWCxburOU=
X-Gm-Gg: ASbGncs0ml7nwW3pnyT6xYmA6vO0FH/8xnluBlfS+GybY6iDJiSEocpiZ3hQAjK3bkI
	PTuS9EZDHD2WQRrqVfaatS63rLLyYO8bKZm1q
X-Google-Smtp-Source: AGHT+IHylWd3Joe5SHF/2a1Y0xiMjxkNMDbIU78QU9/cG9E2ebTopCYzx9g9P+KV7pvtGZ6fNFOJvjBaWzPDrhCsEzI=
X-Received: by 2002:a17:90b:3848:b0:2ee:5bc9:75c3 with SMTP id
 98e67ed59e1d1-2f127f50a6amr8406329a91.5.1733969583724; Wed, 11 Dec 2024
 18:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20241211134505.2218386-1-guomin_chen@sina.com_quarantine> <Z1nZPmB7nW7HUdYL@pluto>
In-Reply-To: <Z1nZPmB7nW7HUdYL@pluto>
From: gchen chen <gchen.guomin@gmail.com>
Date: Thu, 12 Dec 2024 10:12:52 +0800
Message-ID: <CAEEwsfT3QikwmiiVKq4p_UU1ph6x1+w7wepkO5ohDA83dXKNmA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: guomin_chen@sina.com, Sudeep Holla <sudeep.holla@arm.com>, 
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_181305_147857_B5507AB3 
X-CRM114-Status: GOOD (  21.87  )
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

Cristian Marussi <cristian.marussi@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=
=8812=E6=97=A5=E5=91=A8=E5=9B=9B 02:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Dec 11, 2024 at 09:45:05PM +0800, guomin_chen@sina.com wrote:
> > From: guomin chen <guomin_chen@sina.com>
> >
> > Currently, scmi_bus_id is only used to set scmi_dev.id,
> > which in turn sets the SCMI device name. After removing
> > scmi_bus_id, it is clearer and more meaningful to directly
> > use the input parameters name and protocol to set the SCMI
> > device name.
>
> Hi,
>
> even though using progressive IDs in devices is less readable, I agree,
> we need ID in the name to keep the device unique.
>
> It is true that we can have only one protocol/name unique pair amongst
> the *requested* devices BUT it is also true that the SCMI stack as it
> stands can be instantiated multiple times if you define multiple DT SCMI
> top-nodes: this is already used in the wild to sort of represent
> multiple virtual/physical SCMI Server backend (all anyway identified by
> ID-0 as from the spec...)
>
> So if you have defind in the DT 2 SCMI instance with both a protocol@15/H=
WMON,
> as an example, the arm_scmi/driver.c will probe twice and it will try to
> create 2 instances of 'requested' devices for 15/hwmon and both of these
> will be attached to the same *unique* SCMI bus...so we need the uniqe ID
> to differentiate them....same for the transport devices.

Okay, it is true that if two SCMI instances are defined in DT using
the same protocol,
it will result in devices with the same name. Thank you for pointing this o=
ut!

Thanks

> Sorry but NACK for me: regarding the readability, I could agree, but you
> can anyway easily understand which device is which by looking at the
> drivers/ links generated in the scmi_protocol bus directory.
>
> Thanks,
> Cristian

