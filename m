Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF836E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syJvSBYWmoc2bQ+suPVmqNX1ElaxT5/1N2KtMvR5unw=; b=rmWM58x3fhxLEh9wdmfdlTI9Wd
	GqMMD811z4BB2sbeLng1ntDuL8FrgwC/QsK8LneLwG/ivh0bB7hT7MBJjjq7r+ejrXvn0QlqOYEED
	Crscsge7EZBiGHSQV8MB3iYUhORTMmAGfY3MGMpZJJyrFWtxnU7QVAAUleWIU/ZD4ZMXuxqBnA33g
	kBbGuLG/L6Y+zamwma3W8n54uIAdzBfZnakSCNRJxtAsNw+tWeS95zWxC+1Wc1Hb/GVjOsmmMMTky
	N/gH64MEoZnLCxsk3ym4K6GvdXwVt2GYEMRd2tbdny6s+Nb3aprvSa29wzeGhPIIvj8yR1eKeQsaA
	5VHXiVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskYs-0000000A5sA-0C4g;
	Wed, 18 Feb 2026 16:38:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskYp-0000000A5rE-0qCt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:38:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4359108fd24so11305f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771432677; x=1772037477; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=syJvSBYWmoc2bQ+suPVmqNX1ElaxT5/1N2KtMvR5unw=;
        b=LtUuCVnn+Gw3SvBUKxeOdtn45pvpWRRgvlh6nSfNAvrMtbfgtv7/mDinrotf+qZzHq
         QJCt8/ywZEJmk1yPHjOaQXgnKWeT978yZPT8zKWjLN8kygjNA20joSc+gxi8Vxe5/njz
         60YrmoxoaL54whdnFGtv84a4i38LG6n5wnuhqYHUp6ILqbbxFBKQKaXCSfmRbcZ5Dbfp
         2Yt5Kv3NdlEBxPanLHH0kWy037Isossrj8nZqqKfn4nDvLRSOmXEreTsm9nJGi7bnliz
         z1F6/Xme3A41l+HZDY+ys+ltjs9joPbXVp40GXUDsFN/bjm28SVj1COY7IlDl/c4cj9K
         dJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771432677; x=1772037477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syJvSBYWmoc2bQ+suPVmqNX1ElaxT5/1N2KtMvR5unw=;
        b=gX9XCw9idj/ieXGkHJZTaS+2AJzP/Y1YANp9fGv+/wU/Ab0/owRH0QYDMj0dJLm8vI
         WphIf+uJ5cC6gSkjhv19BwEmVEw47lJKS2mMpRsGhSkL54ywwrQMSY2n8uMEFsmgbrqk
         YU575RVmLJ1nZenG7eVX6MvUyeMhQAOIlrh0Ll0Q4eTvkPi4WN2ZeKCX3HtEeieRnBn3
         GhzYQ4uHeF8abGI7G9gc8e0W3yZfX0DtRa8zEsYv2LTsQj+cxJ+OeMAfrDbO4GXPdhGo
         1hnRrrknPPOr8OHnfhgR1raga2CIPjdSVH0KZ215A3G3Y9X0QXXp7Se97hYB8+C3ma/q
         Qr3w==
X-Forwarded-Encrypted: i=1; AJvYcCXAOF/ISHsPuOshL4Taw34CXLJhDS7K1m2Kae73agXuybj9SM2nwXg8h/2AFqzXYAOIbqLC1/ybtRJXINEryqqN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3AC3zwy+edbqhclB4SnKiUjzDc6qzan1eCrDmOPQxVYkZkSAk
	wYA8+FYp+yWLNtSwHAHVs0GZlluqLdkEKedgJVf6kkCUKD0wVWVR9p5j
X-Gm-Gg: AZuq6aLC4j6l2eZbZj2LLqeblsjGQCxjRf6QP9S07F6yZjtjcC+Si3sXCcH/qEoS5ug
	SUsUqbTy8bkmD1J3y0TqfiG+RZy3p70akLBygJet0K6RITJxrPcwKDjX2ONmDPWseNg2RrzNhk0
	zrI3L05pI7VTH9UKRKE0V3l4HTHFscqAmyp8SviyHVcEbo430T7NXzIRdjrN6ZvFsgEIIK0V4Ll
	jcDEgjh12Q4Ve2THua/P+Na4C+76e/3dXCcD+Bq7c24Mv11vRYHJjrijLO8DHTHlOwTB8gHZy4P
	lL36VnK32N/T2+j5rpooBe7zUCAFD8HokmWh00m5RQLyiBOhiMYlrW2RA41vN4mq1or6vOi5aJ4
	ZhuPMui/2PoA0JNevRGKZq+rA3MWhvQsTt9Q+MCnn8atfcGpXYxQgfQ9ESDRj3sJVxjlWwrMjS4
	4s50URdFO/cY3Wy2TouSpzqfexrMltwGyuze5V
X-Received: by 2002:a05:6000:26cf:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-43958e4c9a0mr4169076f8f.40.1771432676926;
        Wed, 18 Feb 2026 08:37:56 -0800 (PST)
Received: from eichest-laptop ([178.197.206.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm43928122f8f.32.2026.02.18.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 08:37:56 -0800 (PST)
Date: Wed, 18 Feb 2026 17:37:54 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: imx: ensure no clock is generated after last
 read
Message-ID: <aZXq4gn4xhInQQlq@eichest-laptop>
References: <20260218150940.131354-1-eichest@gmail.com>
 <20260218150940.131354-3-eichest@gmail.com>
 <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_083759_280990_94F5E15F 
X-CRM114-Status: GOOD (  14.77  )
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

Hi Frank,

On Wed, Feb 18, 2026 at 11:26:52AM -0500, Frank Li wrote:
> On Wed, Feb 18, 2026 at 04:08:50PM +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > When reading from the I2DR register, right after releasing the bus by
> > clearing MSTA and MTX, the I2C controller might still generate an
> > additional clock cycle which can cause devices to misbehave. Ensure to
> 
> Do you means SCL have additional toggle? You capture waveform?
> 

Yes exactly. We were able to capture the waveform when the issue
happens. It doesn't always happen though, it depends on how much time
passes between clearing MSTA and MTX and reading from I2DR.

If you want to see the waveform, I uploaded it to our server:
https://share.toradex.com/dwnhcrl6b9toib6
You can see the additional clock at the right end, after "0x17 + NAK".

Regards,
Stefan

