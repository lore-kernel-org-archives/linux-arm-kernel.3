Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E78D0BB4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 01:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWSeC2gaqWVSkCq/dJZL6iYS2BxOmWNA+qA4J5Rf6QU=; b=0/e4oUUL6IYOjvEjhMbx93aBpd
	/VsQ751Tti3jNwBf/neUAAYmoH6GtIrJwJxinTp6s1rZyu1TZVr3RrPXcNsdZ8KFoqPPjVAuBP3CM
	MHbGQf1a1FNzw7CAQgQK9UMfTwCBq+SO32QJRyC2/9/rJGBJjROmvZVFgR0vTOqCHVURuHQdg3Wg0
	5jYJO4F0zErMdOOPm+SRlTXK3Ny7zpnrKfpc89+k+K6fsGfsaGlJeJJkpNfOCVwlrmNhppO4X3qjK
	FElgVCU501dnPpAHDOknOR+Ra/uoq8IRjq1k4qlfTAiybBF3rGwseKWsPPxxMLRywjK4i/HWS/Mya
	t2fLBfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mei-0000000GPqh-2yXq;
	Thu, 24 Oct 2024 01:28:52 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mdA-0000000GPgH-0i2k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 01:27:17 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7180bd5b79dso188898a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 18:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729733234; x=1730338034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWSeC2gaqWVSkCq/dJZL6iYS2BxOmWNA+qA4J5Rf6QU=;
        b=GjtSAF5c8GUUWe0TKC8pZeCbKtXzozzpXOG09dFDEuX7EKg68EIKXxfgRgOEWlhnR0
         ZlRrfhebjHk8PHRT1MfdU5cK74z3tdwrnfZoNDlp56eCRSxCvRli4JWc8bX9VTgIGCfw
         wx4es0/A+LrZhUjNxXMBRKbbjn5KIoaQ0o0uUU8ZZ4Z64lL6vkUkP0kpkQUx13hbCnGc
         iDm6mxCV7QenWEU2AyDHj+Uj+uazNBD60SQPzY9lR4PJupHHlGYHxf/NfdJ0R2AMRWI1
         xj6/TfDfy3eSZGfCjUBQRYUMnI/Sq1WVbFlfeNp6rMJ0ajefBweqGblph7oLvIGUNV4n
         jdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729733234; x=1730338034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWSeC2gaqWVSkCq/dJZL6iYS2BxOmWNA+qA4J5Rf6QU=;
        b=bRnRnQkMa5T1hiGDkmAhJf3IeDsj/fUzzkKDEjfe04DrlvOgxugELyv+EHzAKJA38W
         PKm7IqHJR8oEtfc5io8juPuMQ/bRQ2VXRDg7D3z+rsOviyYIV0Pes6JOQaeaSBMKi+/L
         NxIyLzkB/pL4EnbciZpFirrZspkwUdj/vh4CY4iz4Ti3XC8J0aDK6NxVlJImD/grnYiw
         DinSIx1lxZB5zDQOj5cwmhrpTUWSG3hwt8EtaHZnyWIB/Nw+2cWxkBxRhDQPr5Ru9b2i
         nJNkZBkR/QpzboENLTuJVHRQ8ZqX/IjiYLeUXvGPW9c98cAc1oyGLU1gU+VA+Nz+z9Er
         6tbw==
X-Forwarded-Encrypted: i=1; AJvYcCUB3AuVd0FiZwZLjfXauYjuJggqD9/dpk94FGXvIOKPB2gv0+ZytyNGxz4PnrvPoLpKPMdyiwx+7ovqpYO3NM7k@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxv8qy0UkcsM0bFaNtkPP2hdiwRG43cJLBFoQdhycxDBimiapY
	4kZ+bs9pMOi2DYEEJwjxy+/cnL5PN9wBh71XWEQax0/1IUfv34NE1IZAz6xblL3tNIbrF5627/K
	DsAIebOGTU2rOaZ4cgoAEJgq7cLY=
X-Google-Smtp-Source: AGHT+IERBCIjWGhhcVKREljzLSYfi+HNM9xg8h0I65CKvlaMOL3JWXyGQU2rMzDTE79TCRpZWYY5nypteKTDbli7Uvo=
X-Received: by 2002:a05:6830:350a:b0:718:1793:ecd8 with SMTP id
 46e09a7af769-7184b45037fmr3937174a34.30.1729733234617; Wed, 23 Oct 2024
 18:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org> <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org> <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
 <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com> <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
In-Reply-To: <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 23 Oct 2024 20:27:03 -0500
Message-ID: <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: add async request mechanism to empower
 controllers w/ hw queues
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, mst@redhat.com, 
	javierm@redhat.com, tzimmermann@suse.de, bartosz.golaszewski@linaro.org, 
	luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com, 
	bjorn@rivosinc.com, ulf.hansson@linaro.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	marcan@marcan.st, neal@gompa.dev, alyssa@rosenzweig.io, broonie@kernel.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, peter.griffin@linaro.org, 
	kernel-team@android.com, vincent.guittot@linaro.org, 
	daniel.lezcano@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_182716_231031_91BCA3CA 
X-CRM114-Status: GOOD (  34.50  )
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

Hi Tudor,

On Tue, Oct 22, 2024 at 8:27=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi, Jassi,
>
> On 10/21/24 5:32 PM, Jassi Brar wrote:
> >> On 10/18/24 8:49 AM, Tudor Ambarus wrote:
> >
> >> The active request is considered completed when TX completes. But it s=
eems
> >> that TX is not in direct relation with RX,
> >
> > TX and RX are assumed independent operations (which they are).
> > TX is sending a message/request to the remote successfully. 'Success'
> > can be indicated by any of the three methods  TXDONE_BY_{POLLING, IRQ,
> > ACK}.
> > You seem to assume it should always be an ACK where we receive an
> > acknowledgment/response packet, which is not the case.
>
> My controller driver indeed ties TX to RX and considers the request
> completed when the RX completes.
>
Does your controller require RX or the protocol? I suspect the latter.
Anyway, the former is also supported by TXDONE_BY_ACK already.

> >
> >> Is there a specific driver that I can look at in order to understand t=
he
> >> case where RX is not tied to TX?
> >
> >  Many...
> >  * The remote end owns sensors and can asynchronously send, say
> > thermal, notifications to Linux.
> >  * On some platform the RX may be asynchronous, that is sent later
> > with some identifying tag of the past TX.
> >  * Just reverse the roles of local and remote - remote sends us a
> > request (RX for us) and we are supposed to send a response (TX).
>
> I was hoping for a name of a driver, but I guess I can find them out
> eventually.
>
Do these usecases seem impossible to you? Many users are not upstream
that we care
about as long as we are not making some corrective change.


> >
> >> Also, if you think there's a better way to enable controllers to manag=
e
> >> their hardware queues, please say.
> >>
> > Tying RX to TX has nothing to do with hardware queues. There can be a
>
> Right, I agree.
>
> > hardware queue and the protocol can still be
> > "local-to-remote-broadcast".
> >
> > While I don't think we need the "Rx is in relation to some past Tx"
> > api, I am open to ideas to better utilize h/w queues.
> >
> > The h/w TX queue/fifo may hold, say, 8 messages while the controller
> > transmits them to the remote. Currently it is implemented by
> > .last_tx_done() returning true as long as fifo is not full.
> > The other option, to have more than one TX in-flight, only complicates
> > the mailbox api without fetching any real benefits because the
> > protocol would still need to handle cases like Tx was successful but
> > the remote rejected the request or the Rx failed on the h/w fifo
> > (there could be rx-fifo too, right). Is where I am at right now.
> >
> No worries, I'm confident we'll reach a conclusion.
>
> It's true I implemented just my use case, but that doesn't mean that the
> "request" approach can't be extended for current users.
>
Sorry, I am not sure we should make the api dance around your usecase.
If your usecase is not currently handled, please let me know. We can
discuss that.

Thanks.

