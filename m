Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77563CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oBqfpRAY+zECAwZLtJSuIalpAzdGoxXVuAiQRl3Bkg=; b=aR8Npi9jhYpQv1eSamGs+LuogL
	xQTCv1muUEuS0tt0AWIHsvOXbbN8H/Ihk7JKnj+4aHomPHTq/IxQByzwh8tcvSk40+E1d7rI8uV8A
	lWbWpTU369DCrpRh7tqeuzS8ilmnaoqK/B5v59vmNdc0S/vwpPuqk6WS39NpfkhQeAgmLp3y9WabA
	0FaqEK6X+dqn8/ok61iHndpqcja3Ato9sqpojX+IjUfufwcLP9F9CKCR87ydLwuWBMwnxPVknhOZJ
	Ecpa8ohi3DH4i9KXlHRKIIzjGYzEYhEP3+OsFBCciDcjQaw8xcMgjVtHHxLOAZNZ4PChpuUIiQsWS
	yQXm23QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLGk-0000000CAJs-38k3;
	Sat, 13 Jun 2026 10:07:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLGE-0000000CAHo-1fk4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 10:07:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490b1df16acso2064635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781345200; x=1781950000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oBqfpRAY+zECAwZLtJSuIalpAzdGoxXVuAiQRl3Bkg=;
        b=pGkkCALZo+uhpuTeV5XMeKR+xOBO6niLEuZIYhxhjUB3YPcGq2DFxzYAihvMhF6L7i
         s+9GHQjwEPgydZvXcKq9QtMi0zNSEprGFYPHk0YoT+S2z/IiZYZuIz1rVAAw1r4z/OO0
         WSe+Ke5gFllCwKbzfg1eEHA9ixbvZuhsE4fOJXATBsrnuAINzgwhTSS/Viwf9kYxbVFe
         MYuO2I5vsm9zmQnokQVRMOsZFaRTJ9yqEQqzjjW2mlQVgNVS3aFG4xVGRrng0CN52sSA
         /OlXJEZjoI/YZrhJW8QrJ0YNSVeLudHI/B2QOXKzhciCCLQjj7cYTrKdBWFYs7lsmXp2
         wHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781345200; x=1781950000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oBqfpRAY+zECAwZLtJSuIalpAzdGoxXVuAiQRl3Bkg=;
        b=JxD0CSNadTXv62lV0CidLV0HG253Mhx1ySPiE4QyRlTW8GZLIKgYVAka2tSybBmy2r
         G1mYu0AP+dhsEUJCBpR72XtljQzoTKdja5lwKZaASMcoVdBMcMaG5vgj99SZFSQeCW5/
         AtVp+sn+chEnLk0ICxg0IbJ1vFx58oJFv9/NcKKsZorhnkic7PG+tolNXf54zlr2mLxh
         lGJdvjk01rK5JB+RKg2jcCbb5640+UHs5/5IjxoC5DGEPoquKIpzs/pb7IsEGhtfQ5LD
         jhitdPNtyb+hOAutoqDisX1jPbuJsj8RZ54ZqnBKbvzoZ5hH8W72DmaBjGjw2hlZphEg
         RJJg==
X-Forwarded-Encrypted: i=1; AFNElJ8SGHWcJCPmy+7Rdt0/yNrsnVWMweAr14xj6QfjzyHpQFF7vxZpzq2kzxyang12HvYgdvlkUwk20eZIkXSZsmhM@lists.infradead.org
X-Gm-Message-State: AOJu0YwFryg2spqcQKni0l0mTAPMeRsnZ9eK2X3Xb6OXvVw1PbAT5gSB
	WYeGjYdbz0XJe8loXfYCqAece3yEneFgMDRD2333kLp71eQbll5CQusw
X-Gm-Gg: Acq92OHt5iq/cCFiRjD1XYEeYg7lBTkv71St7r96BQC5HfTsEpli5aeQt2LV0++B6H7
	hZM0ivRvx1Fa7vUYfb0SVpQ/vGPBNu6s2i0FYrsboOBxsompiB39DmMOq7cHclquVqIvjk+HDWJ
	zAhMedxK7d4XORjRuuq0cmek78nRYKdKz/Tvh1cNjB63aufTXaj0TSsTwGFtnF60hIY7kvJ7/B7
	BaAoAteR6blQslm7XEysSNW7eMtgYSnvvwxo2M2c0FtXxTdr8kKofhA0DDRtTJDfteEyshRaAcK
	n1/LgkCiDjiW6gc3YhIs76j9uLFyWDYy+EAsC5rgZlkmARaZl7CKkrkN9jpAUh/zespMPy0kNXD
	c+IZj3XbubyfPNadl+KrIHg8qY6Ltwt8XiZzo4w/URs/GMvx7XBBY3+H+LytzFbCsk1fJH+1GV5
	0C2BeKKMHtcxIO0UdbYd7nlwRAyjfwG/sxTSrKqbW/ccpTmjE6UrKcTNtmcqZA1/s=
X-Received: by 2002:a05:600c:4743:b0:492:1eaa:a8ba with SMTP id 5b1f17b1804b1-4921eaaa99bmr25666125e9.6.1781345200044;
        Sat, 13 Jun 2026 03:06:40 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922032ae56sm61699805e9.7.2026.06.13.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 03:06:39 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: linux-crypto@vger.kernel.org,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: Re: [PATCH] crypto: atmel-ecc - remove stale comments in atmel_ecc_remove
Date: Sat, 13 Jun 2026 10:06:38 +0000
Message-Id: <20260613100638.47312-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aiqUBXIybgHXA6uj@linux.dev>
References: <aiqUBXIybgHXA6uj@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_030642_488108_F9B6098F 
X-CRM114-Status: GOOD (  36.92  )
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

> From linux-crypto-vger  Thu Jun 11 10:55:01 2026
> From: Thorsten Blum <thorsten.blum () linux ! dev>
> Date: Thu, 11 Jun 2026 10:55:01 +0000
> To: linux-crypto-vger
> Subject: Re: [PATCH] crypto: atmel-ecc - remove stale comments in atmel_ecc_remove
> Message-Id: <aiqUBXIybgHXA6uj () linux ! dev>
> X-MARC-Message: https://marc.info/?l=linux-crypto-vger&m=178117527182807
> 
> On Thu, Jun 11, 2026 at 01:29:52PM +0800, Herbert Xu wrote:
> > On Tue, Jun 02, 2026 at 06:52:49PM +0200, Thorsten Blum wrote:
> > > atmel_ecc_remove() no longer returns -EBUSY since commit 7df7563b16aa
> > > ("crypto: atmel-ecc - Remove duplicated error reporting in .remove()")
> > > and is a void function since commit ed5c2f5fd10d ("i2c: Make remove
> > > callback return void").
> > > 
> > > Remove and update the outdated comments.
> > > 
> > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > > ---
> > >  drivers/crypto/atmel-ecc.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> > > index 9c380351d2f9..e6068dc0a0c1 100644
> > > --- a/drivers/crypto/atmel-ecc.c
> > > +++ b/drivers/crypto/atmel-ecc.c
> > > @@ -347,13 +347,11 @@ static void atmel_ecc_remove(struct i2c_client *client)
> > >  {
> > >  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
> > >  
> > > -	/* Return EBUSY if i2c client already allocated. */
> > >  	if (atomic_read(&i2c_priv->tfm_count)) {
> > >  		/*
> > >  		 * After we return here, the memory backing the device is freed.
> > > -		 * That happens no matter what the return value of this function
> > > -		 * is because in the Linux device model there is no error
> > > -		 * handling for unbinding a driver.
> > > +		 * That happens because in the Linux device model there is no
> > > +		 * error handling for unbinding a driver.
> > >  		 * If there is still some action pending, it probably involves
> > >  		 * accessing the freed memory.
> > >  		 */
> > 
> > Please fix this properly rather than fiddling with the comments.
> > 
> > Drivers should always fail gracefully if the hardware disappears.
> 
> Yes, I'm working on a fix, but it's not ready yet.
> 

Hi guys, since this is going towards some work I already presented here and
still waiting on answer/request for comment from maintainer(s).
https://marc.info/?l=linux-kernel&m=178099821038957&w=2

The issue in the remove() arises when working with devres in combination with
asynch slow bus hardware, as we do here. AFAIK in the remove() are mainly two
options, either give a timeout to solve communication gracefully, then cut; or
wait indefinitely on the device to clear, in case forever.

When we cut off after timeout (first case) and still something arrives, it
would probably access freed memory resources. In the second case, simply
waiting on the device to resolve, might contain the risk of an infinite
waiting at driver removal. The other alternative would be to manage kmallocs
manually, i.e. to move away from devres (probably not what we want).
Currently, the driver just simply cuts off and has this problematic situation
very well spotted by the original author and commented.

Further, related to this situation in the remove() is using the global driver
data, which then might be overriden, and thus leak, when still around, and
this connects to dealing with synchronizing adding to the i2c_clientList and
algo registration, both happening in probe().

I tried to address all three issues. That's why the patch ended with such a
lengthy comment. The patch is reviewed by sashiko complaining only the above
dilemma.
https://sashiko.dev/#/patchset/20260609092927.47222-1-l.rubusch%40gmail.com

I hope I did not interfere too much with Thorstens fixes here. Since I assumed
you were active on rather different topics. Pls, let me know if so. I just
want to see this issue out of my way for the refac patch series.

Best,
L

