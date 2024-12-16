Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4A4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLuSdhXzU5fPjlBaCI7uTe9mEWq+Czmflhxz92Y3yQk=; b=eglt1yTkSVr1hnFFvKm76+hleC
	lF/usOkVRjJ7XJgi77Yoafjekh5B/nQ7MGEjqF70muDTVsadSia4gotat1RrivU6bhOxfucaNG0qm
	li902vzTqjXrFB4TuiQRBSZ6BoM2Q+3k6/Rn6Lzh2pTUbiPp4AJSBE1uL8Pelzjh3SpWyiUCxEzPf
	rkVwIdRLwAhRDUyX2lSvSJghzrhsI3jNWmZ7OFOL8Cxdc11P93gXKRU965KNNeEgTSm+LBxBjoiXZ
	5Bnaa89cR/qjZpvhavCrd+6U9LgNyl+vruaQGhATaXk7dolWLT0UJeHu5N69W7y2358hKiCA0Bv1V
	afKKM5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCeQ-0000000ALMW-1Wgg;
	Mon, 16 Dec 2024 15:04:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCdL-0000000ALG3-0cnR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:03:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434e3953b65so29238115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734361422; x=1734966222; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLuSdhXzU5fPjlBaCI7uTe9mEWq+Czmflhxz92Y3yQk=;
        b=N/zfBk+Fo97Z0sJN+eXlly7CLE+f9V2FtDomlpyhDCT9uVJxj328Rz0BldDCCl0/ir
         sXVo2uZrdtMfGhUpkMC+5UmizE5+en11n5CP/h6dysvsu+sNoHEzgSSJ+KwZkTRKUteM
         XAyALgpgnzxjbwjAfQ5kwUgrLNXN7rKZnNVGxdrqXwtE2aJjot42VD9X1G0OY8I85pXn
         Y8PqNGerXPQD42RS2k8al9QkbwAkCLl+RIG3B8F58fiITB8WB7YMOc7L7w5pmWod+q+5
         61/LSYtfsucWYjVIUOWslVZLTExUYpHht/vBfaZHkoOdYtXBRE7pbMDSguqcduuexMpx
         /vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361422; x=1734966222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLuSdhXzU5fPjlBaCI7uTe9mEWq+Czmflhxz92Y3yQk=;
        b=KOz9L9gNNwrOg/b1HexHHfhHFoz4lLJRUGMcwBe1aCoW6DVbUNM8LCjup/2JxlQ7sV
         uPmYkx2KMmu53BgSGG1Z5W3/uDTHphVx9hiKxqlycCA9gbc4vZMEhmIivJNLf9CXoMic
         pdAiCcW5E90mWMlb1OzOPklN/DsajlFlirg/VNPDfv8PetoFasGrgQZrl7s2J3lAI/54
         0SLJljrSYBQQ+cOd6bA/aFVtfNBnfibRjU8dujBJPFQ4dE5BFaZnGhxNDmCALcmSQwVo
         6hG2lCCMEDt53td/HH5kXkcoIu2DiWhoFzfJSQWZnPQdVM66YfouGGpHc+Cw/vIKEdaQ
         iugw==
X-Forwarded-Encrypted: i=1; AJvYcCXikLhXMBIa9ySCgbzU4psX/vnJna+rRDCP+7h3+AVW6vEOIZYdggPwEAI8r3UROYM/KjqY7EK7dPj93iFvoM0+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjyejmi7+MM0aNPpLV6ogjmmD+x2t6W8X8c1z87a3Q2oRBLG5A
	0W3EN1AFyRkY5q0vNhLQupBcdO9Z7HedrJARMf3MtWkIMJsEVjBKrtug3wKY1+o=
X-Gm-Gg: ASbGncsxADDoYiPUibazHUL757tlVnNLp+kpsU8b0IemNnOjelFyMoJrKDhzHJPZdLO
	01jLxC5QJE/+z6jF0A3uRlCjwrXMWlPtZngGHte6Zh0zUjcANgCkbVn9TOvwXvQJO/B6DhON/Gz
	uRUTOBKmlfr+wr4pAg67oz42crR2WJ9Iuq81EsV2X7DfHr3+1ho8+r6olc0Oo0J6fMuo7wSNcuk
	o3PUKQMp7eed+MaMaO1ERog/kqfpRyPgzmA5T6Xoz9+LdoRpf8Rucsm4MbvBg==
X-Google-Smtp-Source: AGHT+IFgA7pE6iq5l4aNj3MEJdJlOnoKDyOippnT7SVkzxP8qOFsy+JUmRbt9eJuqN9H6l9ghLXbHg==
X-Received: by 2002:a5d:64ee:0:b0:385:e055:a28d with SMTP id ffacd0b85a97d-3889ad38e4amr9996892f8f.57.1734361421518;
        Mon, 16 Dec 2024 07:03:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012034sm8305834f8f.22.2024.12.16.07.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:03:40 -0800 (PST)
Date: Mon, 16 Dec 2024 18:03:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: gchen chen <gchen.guomin@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <c3803026-8286-431a-9042-62cf46ede408@stanley.mountain>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto>
 <Z1_2rxJ7TOEIOMp7@pluto>
 <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_070343_195320_075739F6 
X-CRM114-Status: GOOD (  17.80  )
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

On Mon, Dec 16, 2024 at 06:37:01PM +0800, gchen chen wrote:
> > > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > > index 1b5fb2c4ce86..bbf1f05f2be3 100644
> > > > --- a/drivers/firmware/arm_scmi/driver.c
> > > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > > @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
> > > >     cinfo->max_msg_size = info->desc->max_msg_size;
> > > >
> > > >     /* Create a unique name for this transport device */
> > > > -   snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > > -            idx ? "rx" : "tx", prot_id);
> > > > +   snprintf(name, 32, "__scmi_transport_device_%s",
> > > > +            idx ? "rx" : "tx");
> >
> > I agree on what Dan said AND also this results in having the same name for different
> > devices across 2 instances if you have a per-protocol channel because you havent anymore
> > the protocol_id bit.
> hi  Cristian，and dan
>     Because I used a 3-tuple [parent name, name, protocol] when
> creating the SCMI device name, I removed the prot_id from the
> parameter ‘name’ when creating transport devices. This way, it avoids
> the repetition of protocol ID in the SCMI device name.
> 

I haven't actually tested this code, I'm just going by reviewing.

scmi_channels_setup() calls scmi_txrx_setup() in a loop with a different
port_id each time.  The info->dev is the same on each iteration.  Since
the name is the same except for the rx/tx then __scmi_device_create() will
find the existing device on the first line and return success instead of
allocating a new device:

	scmi_dev = scmi_child_dev_find(parent, protocol, name);
	if (scmi_dev)
		return scmi_dev;

regards,
dan carpenter

