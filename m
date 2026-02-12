Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45890EDF04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=; b=Ya9nleIoknqw41vNe/3OSnKCUp
	Aksnqqrt0FBiSkJm/1kRjRYWR3hcXmS1PkmjxS+06CCV6rQ70p00FHjnCc45kZEC/HT4OUMb5+N3M
	p7MbfIjmsva6cQmFUbjzK/++EqaTeHGltHh+bpskgX+TvMBKqVzEymqNiBS9g7bpijobMxrq9tbGV
	NprL6erK2PKwnnBhTnOVkc78lKFR77wAo5LSjEtvd284d0J8r/YYZAIvbxO9hKwK+rLtQOB7hP0+i
	PqdzlWxGM2Fi1pXQIs5Ong4abnBjw3XSYJ9kAigyUbmKgjRW9CA+e4v0au9I2oDWG3UV4cvJH7VlU
	M9norsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQpf-00000001hZu-0dKf;
	Thu, 12 Feb 2026 07:09:47 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqQpb-00000001hZV-3enV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 07:09:45 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-124a1b4dd40so1912003c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 23:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770880182; cv=none;
        d=google.com; s=arc-20240605;
        b=DcfVDhHrKMIEkX0GD/v2FJe9uQ+KraXB2W0UvSUVHtbAU0StbtMjavuRuutMU3AYVP
         aSKmR9nqHb7lHyBLFLgN+rHGawjL4DZVHNSD9zEMPvrVZzWUU2C1He36dSwJrNJKYJQs
         J1qYO8nO0k+tT4+CIaZiY83xJm63djOTk0Zk5IUfzwirwMAjYEsBWvTUBkHBty5B6snJ
         vHG/BreBUTzeBpmxMbdRRAzEbsUlIZ4V1j80ooBpWuOjMRF11PNCvDslmaNi9j7kswNd
         gsUmV7BxXgkXfVo0Y5LOL0oWxIoNx5bGzMur4Wiwxon3wEKnbvP4VWh27lFDRt1+ywsR
         q28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        fh=Mc+SnluobJmTen6mN4XJVTQglAsL2l16Xb0xVQctDUc=;
        b=Lgy48IggvMA4JaZ2HzmSSyLGI7nHQAtZBdfa87i8SSVzB0q+Ebj3Fa7CMByyQcA9EI
         E1Y3Ou41HWzr+yUos391kV0JlPL0f2kboVlWayqsFENdHoKifXUzVMDGpKq8ngsDwizm
         A8tvtZhBkCChMpZZgRM49vbhqJP38mqimPvhBgcOipfo4KwCj6shieRFBP1twN4AJ0o1
         z42QuY3E6ZoCC4rOIBP8IyIfC9gpm1z5hcozlD43NAkz4AdOIVzsU+A1chJRVc8qtAWB
         WRGJw3l84uw/EIxkzteX1PlTyGiFyoO3byM+oa2zqswnoxgfz0wyZQFIJyxkyCQD84Lf
         CD8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770880182; x=1771484982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        b=ARTlaNiWUKf+MtD9PgGaCgKfz20wrnmJviO7TAEY2CTFkFddaNM5wLonwWaEvS+914
         skEArAUUTg9CH4BzhRa1k/RSk665sLucuAllBPrCSFQ7HbiquESvl5yKuZW2s4RZVuip
         KBYvQj4M5GJwy3Jf86KpyR1fsNtTS3x8SG/6BM96wzUwOhVM8kYGvQK8K7dt2smcHCH/
         7MeJo/m4W/xw1tnLgpUqKkWOi0ahkDVTk+LjSXpgwzSyO6RE02Efz/ztBpyapdZ6N73a
         ZVJnHRrSpZPkkaA/LHuxGFsfxpt7Z7sjs06Wu0qbKsNCixyhDS5feRL3DbUU87WEeA+n
         v89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880182; x=1771484982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        b=ZUpZmMp/dWugMQ6yW1NLL/EXl5xS+VW34re2Bo2qg0nuW+GpCGc4RsL+FzDNQEX2Wt
         wdXh3699S19KAL/Wxdm3uAvFh4Sm6dN/117AJW+CRKsmy/AUY7wgbOTpOB/F/muZ98vH
         +5vidrqYulDlglIM+uzQkQNuCNI4iah+ZVGnnCjUZI8zMj/nqIVHGHW9tAsc0EV6qH1j
         mfhyMSWF8vsTTqVlJVLUa9kx1hbU4xXfXaXxz5g2dJ+hAOdOAcSrztNlospLrjbOHE9b
         /g67OpiGTEXy3hcCLL5DYyBmdoIZefWtj3NEC1snDHvfTwsn67ZcZMUGFJVies/2OlKH
         ck5g==
X-Forwarded-Encrypted: i=1; AJvYcCUQx/Aqs6n1VjnvoHyyZ97CCBpqE9Wx7SRvKHyOs+qLkT15S/rpbXTAhaG1WQkFeVh+On5wHBnU/IDpJMAtBtsJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz77LbbdXYZC90Ejs1SO3d1uSU6zV7gYVp4w6kNRB5DsSncjFR
	h2NFmw6km88YerNESTI6nARncZ3ml2ldKFrStc0YkNGoamtSDqwEsxQgTXpSo/Ze7XUYkRCl25t
	bYaJ3ReiFUIrNpga0iDHelmBdqFo0+MQ=
X-Gm-Gg: AZuq6aIhPGg6zTy8T4bLprym8bkCjHX1nYs4yT1GzLEC3/FTNYKQIk3tQaIi++BksD7
	ukYENtH2UFlL1AyX4AoE07pQPCBhj4CQcruuBqsVfN/5zYzR/4RhnnVzmIAUrQIEaaybRxAq6xj
	ymf7icxd02FNYVNIOQ72eWRT6Z8f8R5tW9PYg4iA73tzLzQ7aoxw7KnVho5H24kNB9ud8WlzO3K
	a6j24kCY7Gp3LLgTP1Vzuu/Lf3LiLiNzTk2NXfCv890YvY2oPjQn454gK1JC9X30KqXkGonrO+R
	5IF7ql9D8QJ4Jou5nmbeYXzAXqLSa5Qv8HokB7ctqe3mRTfSif5OPpPor8PG7qaOSdutG9vbLZD
	zfv+nHauiSVSRBZqXnHSjNg==
X-Received: by 2002:a05:7022:61a1:b0:11b:ca88:c4f7 with SMTP id
 a92af1059eb24-1272f796ad2mr846334c88.40.1770880182309; Wed, 11 Feb 2026
 23:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20260212053036.2581083-1-chancel.liu@nxp.com>
In-Reply-To: <20260212053036.2581083-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 09:12:24 +0200
X-Gm-Features: AZwV_QherBboHyGiDA8CJURenUrUDzC_HZm3EldthyJ-DQtvEc8-3hgQOSJYk0c
Message-ID: <CAEnQRZBTHt7XjCqDzavdRw+kjSCJ3YyK9rW_Xqg5xUuckOkV5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	shengjiu.wang@gmail.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_230943_935935_CC574D46 
X-CRM114-Status: GOOD (  10.36  )
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

On Thu, Feb 12, 2026 at 7:31=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> This machine driver can parse DAI format from format property. Add
> "dsp_a" because it's one of the DAI formats this driver can support.

Hi Chancel,

Are there any other supported formats?

Possible variants are:

        - i2s
        - right_j
        - left_j
        - dsp_a
        - dsp_b
        - ac97
        - pdm
        - msb
        - lsb

Can you also add more explanation on the scenario for which this patch
is needed?

Thanks,
Daniel.

