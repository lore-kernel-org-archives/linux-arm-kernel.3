Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD9CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDFSf6VtpPHSRKcxIyA+1BMA+HuzuiTfla7h2FaLgn0=; b=gT9bsMFzl7cg3lBzV+O0ERkkEz
	ZB7KFNwr6HYNKjkoQ8eY2fcX+n1f//58UpOMUUzZxsPOkcavSziEbgWqNKUpsuzTfnxqQsFv9cIYZ
	My8usHvz+Y5ONfYLezXYDuWWte7sJ6sYyh36N59AkNchaMw3oEKeHGHy12Z0BV8NWZqD8iOduymeg
	0PSRUsZACxolybfijuD/GBhZN4W7Fobt57OHp13SGh+6IAi63gEjzPXA7Ia307lBLZDUFcaNC1CkE
	VK5XxKWu/Lls885eyCI+14ENe6kqDn/Mw0Hb2WGGhRgMN9u5EcY+rICbMXmmwpDDyMUNwDtp2XNoV
	xAsWUTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umduJ-00000000Rik-3oej;
	Thu, 14 Aug 2025 19:46:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umctf-00000000LWf-0Je1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 18:41:56 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-323267bc0a8so2117592a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755196914; x=1755801714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDFSf6VtpPHSRKcxIyA+1BMA+HuzuiTfla7h2FaLgn0=;
        b=Gsf0nDHLUWqnrTY15QHLqOymV1AG33VUu1S9tmIjgOQB9Phpv+mXn9TBptC/NBL7Aw
         qBoWWLj+0MHMlVvQZrGkxicQaaH3DvRjon9v79oVvpVrEJH9kP8h388svWkmhtDqaN0X
         ShIJOKUN8Ww5LovR4cZo10ber7NDZiMjqQJC7iYhpWGKrExkmiIBQuTKkUFFRDgtczpg
         HWVvuVUGsjeu0D7VZk8lGv9D/N8quu/mVz/u/IpSwcJ7mdynYTc+SWsDKuOV90oPAyuB
         OTPR6+ZBM9/cLyO7ZIfxuco7wGfrPBqbyrEoOrAvTBeoVy5UuBgPAEXXpUDB9FjFzos6
         n/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755196914; x=1755801714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDFSf6VtpPHSRKcxIyA+1BMA+HuzuiTfla7h2FaLgn0=;
        b=kNx+QJoQWXiYKwqiOllJj3wIWdn6BsaRAiEPZJZhIB1BDP9HvHStK/J0Q4z9M2LSQP
         BZmeRGaiCYuWSkpavDEcxmqPXhqDNWRRIY95RtQJWV6zPWTi6LM9sqLONxFI4x01PMer
         DHoxgjm4/RKKKWU3wDti84FJsx7h132ZX2estXl3Mp7NtoVMB9HvSzlGzhsWhcvr5Lpo
         vU0WmUcAuP+caK6AXc9wH7g6d/TNbV+lVrahgpcv67s0sa5VXbBBeegeTpez/6Ee8rm2
         eJEc5BeChowt9bViBNx0j+8L8ozyn0wni7Al1+hnTC6t2ATy14wT37YMX5NsOk6MSfvw
         iBfA==
X-Forwarded-Encrypted: i=1; AJvYcCXdZmmYxEYk4xMXr++WPO8KG+CC/uJIPnuYehnIUKt3ReBGZmJgJyNmKadlRvGQ35kqHEGScyx1zwrSq37Tsnz4@lists.infradead.org
X-Gm-Message-State: AOJu0YyLmZAkUA5z2f0tJbc2lIEin08JevJUSCxFqi0RuFpjPYkuL8gB
	nIbvZ5/sfNSXzL4wGGJ2yUDIfvHOsmP6RU7V/Mv7o1AzGsfM3o6G0xId/9hcJE0M
X-Gm-Gg: ASbGncv5b2Yp/6/4jxFW2nnicn+Xriq820GpgmDScV90E46Ckzqnx0LpOiTuwQfWLPS
	gf1pePJR2Au8umhqQyoSGrltVkgOauchUY7fnawEEMe0Ve80aEc4rjKzWH6iUAJmcuLP1x1zByx
	4XTHzZJnfPCHuruDO127Zrmepy8OneyNJuL9p3Qb/Ftchzrg7wHebzU1sl4G8dCAGJ2TisJo4PF
	U48/LdV+nvWIlcl2c7eUV/DhFDCZWduvHkvTJG230izuVST82H6XlQx9GxR/AIJKsAcqk2egCw/
	QB2vSzBNWg+/z6DDOKUbZHYRVpb2vVTNijXUomTkVmnwn7AW0VM84XW55iDa1HLv3K3IR8t49KG
	xO2b5dLSdbp7ahYcBiieWI8+5s/qy1x/zPZJlK2zfo0TLDzWafGMHc0w0+jl8MFJr1UxPN3eurR
	NkXQ==
X-Google-Smtp-Source: AGHT+IHfccetpow7yjMs7GtNWYKROF86+lwcaLN319Y0r24RCbYznZE4qD/w6tAWLRU5bGeNyjBvTQ==
X-Received: by 2002:a05:6602:14cc:b0:875:95b7:c0d6 with SMTP id ca18e2360f4ac-8843cc87b3amr23726439f.2.1755196461884;
        Thu, 14 Aug 2025 11:34:21 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-883f18d1cabsm562086039f.8.2025.08.14.11.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:34:20 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	shimrrashai@gmail.com,
	tiwai@suse.com
Subject: Re: Re: [PATCH 1/2] ASoC: es8323: enable right-hand DAC-mixer connection on ES8323
Date: Thu, 14 Aug 2025 13:33:44 -0500
Message-ID: <20250814183344.59453-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b5a64166-c55f-4ca4-af92-52c954847af6@sirena.org.uk>
References: <b5a64166-c55f-4ca4-af92-52c954847af6@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_114155_108048_C4B81C2F 
X-CRM114-Status: GOOD (  23.33  )
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

On Thu, Aug 14, 2025 at 01:11:59 PM +0100, Mark Brown wrote:
> On Wed, Aug 13, 2025 at 08:47:31PM -0500, Shimrra Shai wrote:
> > Enable the right-hand DAC mixer connection in the same manner as the
> > left-hand one.
>
> > @@ -633,6 +633,7 @@ static int es8323_probe(struct snd_soc_component *component)
> >  	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
> >  	snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
> >  	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);
> > +	snd_soc_component_write(component, ES8323_DACCONTROL20, 0xB8);
>
> Neither of these should be unconditional writes, these should be user
> visible controls.  We don't encode specific system's use cases into the
> driver.

I was just following the precedent from the driver's prior
author(s), in the manner of the line above it. Presumably, enabling
the left-hand DAC-mixer connection only was a solution that worked
for some devices, and theoretically (as in, I don't know of them
personally), there could be devices where enabling the right-hand
DAC-mixer connection only works for them (the Firefly may be just
such a device; I have only tested it with both enabled at once,
so I can't say for sure. I know it definitely does not work with
the left-hand connection enabled alone, i.e. the line preceding
my addition). And perhaps also devices where there is some kind
of cross-inhibition effect, meaning setting both enabled would
generate problems on those devices, thus justifying your concern
instead of using a blanket for all devices as I thought. In that
case, that means the original author was also wrong, and so I need
to know exactly where it should be placed.

With regard of that though, I see these lines earlier in the driver:

/* Left Mixer */
static const struct snd_kcontrol_new es8323_left_mixer_controls[] = {
	SOC_DAPM_SINGLE("Left Playback Switch", SND_SOC_NOPM, 7, 1, 1),
	SOC_DAPM_SINGLE("Left Bypass Switch", ES8323_DACCONTROL17, 6, 1, 0),
};

/* Right Mixer */
static const struct snd_kcontrol_new es8323_right_mixer_controls[] = {
	SOC_DAPM_SINGLE("Right Playback Switch", SND_SOC_NOPM, 6, 1, 1),
	SOC_DAPM_SINGLE("Right Bypass Switch", ES8323_DACCONTROL20, 6, 1, 0),
};

which suggest it is in fact controllable already, but I wonder why it
is in the "bypass" switch only and not the "playback" switch, which
seems to do nothing (SND_SOC_NOPM). Would it perhaps be correct to
move these to the "playback" switch, or to have both switches
collapsed into a single switch?

In any case, if these are the correct places to enable this control
and it is already supported there, then it seems neither write command
in the setup is needed, viz. we should _delete_

snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);

too. What do you say?

  Thanks for any feedback,
  Shimrra Shai.

