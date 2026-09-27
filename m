Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873C1C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqlZZ1RhSPYEVPxxu8nVXKmxPulry40jU+yUEBcr1Ew=; b=Mx4zCsJ0/QSVJ6kyGW/56C6MoE
	BUE+Q68cZ3Dghu0A9lo2I/bNqa0gsV8un9CIMLhIfx01ImQtQlSjENpr1Tx1okTIFuPEH2tPIoTPS
	PhbhybUyy1hVm6EP2MXYoIRaA9X47mBhChYSADaEErcdvP2uSykFu/ehaxVs+ywoJTGFwjqatp5ja
	skrjkzugnrGlyVwcAHvgKCedunG8+b6Pdsi0vWtMZ9u72BxvarksR7vjjmvjibtyXo6ZZQ4pDO6cd
	tgsfHY0WJSatNy1Zf+dhiE3M0c1EBbEQQ362QMwepl1BpHOS25PBH7uBRVB6+UanraHRb06sVCi0B
	3Vy8QF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtvC-0000000GiI9-3HjN;
	Sun, 27 Sep 2026 18:48:22 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtvA-0000000GiHR-45Kn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:48:22 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3425f2b24a4so945809eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 11:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790534900; x=1791139700; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yqlZZ1RhSPYEVPxxu8nVXKmxPulry40jU+yUEBcr1Ew=;
        b=X28um71EXAUz/81PoXqJ5piPSNOFHoNie2y9JAsx4+1zJIUlEiRGeESbYLoHYJZyi0
         9cmYNCdEdFKkn6F4+8Vmuc4ylQnrTRqTlmyeN9CblsS2BMsmEyvV6sr4shlqsCRW6SVv
         gb30+flCOlzhgG8JpdwXA4amWzQBRAsa/Y4smlHAkznf3Yl7uijdOA+QIKP8++yE5q+D
         JkzloIk3LsHx5hesaXoSGZo+KyEYsUFi08M1Cw292zMdSJGGnMZk57xWXakEy9dWqstb
         p9aOa+JujYNL4H2wd6w0p78b/mhpbbsaDEgqM7IazGaULZN6q4fCBKqxO5XMfBsEmbCH
         HIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790534900; x=1791139700;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqlZZ1RhSPYEVPxxu8nVXKmxPulry40jU+yUEBcr1Ew=;
        b=rXDeRfoyPnF4w0hcOjBV90vVp/1PjyG8Iz0duXwnwe1wXx3Sml/6NGKxsGYwXbGwm+
         4w1CPHSuHqvVevEM+D0HOZv9y0M4F2uA/WrqM0am0ZyJF+3V4+3EHkrYC1jsgjUJObI9
         /gzF1Dw16qkPMlnmLWdNxpkz0ilIKYrD+/9xomFPeDJ39VRAJrRtXwukvZX7lW4S5DfE
         GN+sna+PzOT3GIfX5dc5pnkQFz5NIFzbHMOki9Wf1FklMkzga4XMiLJzMpJDBp7x7/p3
         OMsFKvn7aMkABmRS0oHH+F+24BY5ufB1N7ULiHS+/BS6F+wxuSig0Zm0eZn5HE1Nneq1
         Azjw==
X-Forwarded-Encrypted: i=1; AKwUvBxjeNNWzagoL4/MPf9ril0P6bhY2/obeaQ+nVRTbdB+y5E4Iczm3mm/JTa8PX86a4201QIYEmbSi2Qj4R7ldh8a@lists.infradead.org
X-Gm-Message-State: AFq9FYK1qKBx4OYkg6FqGqaJbchzG+V6EWyqFBeeurfxGh3sIYUojpJz
	1uKMmpXXli0eD2qRKkTlMW9ysASN05ubZb1GNjP4b9d7UNFrfRm2GxT0J+ZGLl79dNU=
X-Gm-Gg: AYBFou32THIfeY2L4YtEmDhoOMJw+22wXgqsj6bPwpB0yyq83q1U18hLCGyI9SCpgxm
	JHVYQeGONvlR33/WjU9XM0eTOYKRiyW5BepFxt86uZs26JMvu6qQHtEfEXR7RPVqFK2mDnDMaD2
	ypaVBZtMvCM5cMWPGwQAfPhQWUcDDAzyOPW4lWbK1BpzOwEpbtMQ+w0atJOsIBAcGeDjFip6lB9
	lkg+U3ZQMWeidkpq/QvZAohMfIEv1+H2DwnmNnC4MPypt+LUto7eO+c7Rxfm04yinJJ3/o8Y9x/
	gcE7VUGcXf73lP18dyIdSu2SqOVWKd/zzDgiv3jpywxC/J4b7/w3wHLRyxuw8fM4YvjQHbTJR+D
	+ZzEWKDGv+GoQaHsSBwPrOpzMjcS6z1R099ADg//8x95VCMCiKREY7PRw1FiA48aHXOPRy8N1E0
	gbnwCtr7nCzCjDuNSSj3jBAV4cnxCM7cASv2xhHSiCUHd5mvFwiwWa1AsHWuK/mRv2xJ7ZMGk=
X-Received: by 2002:a05:693c:62dc:b0:332:946c:4778 with SMTP id 5a478bee46e88-342721805c8mr5904589eec.14.1790534899604;
        Sun, 27 Sep 2026 11:48:19 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm2044300eec.15.2026.09.27.11.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 11:48:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 11:48:18 -0700
Message-Id: <DLQBNCNNWZNO.1AIPW6NRU3GWS@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Raviteja Narayanam"
 <raviteja.narayanam@xilinx.com>, "Wolfram Sang" <wsa@kernel.org>,
 "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@amd.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [SPAM] [PATCH v7 0/3] i2c: xiic: fix SMBus block read and PEC
 support
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
 <arkAZJEJTtNsCjmF@zenone.zhora.eu>
In-Reply-To: <arkAZJEJTtNsCjmF@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_114821_019433_1D69DA6F 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

On Sun Sep 27, 2026 at 4:40 AM PDT, Andi Shyti wrote:
> Hi Abdurraham,
>
>> Abdurrahman Hussain (3):
>>       i2c: xiic: preserve PEC byte length in SMBus block read setup
>>       i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
>>       i2c: xiic: don't clobber msg->len to signal block-read completion
>
> pushed to i2c/i2c-fixes-2.
>
> Thanks,
> Andi

Thanks a lot!
Abdurrahman

