Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA86CA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 22:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=; b=U6lp0XQ1JMaBmsla6YQevM2bPQ
	t9p0bvCpxQktD0slkLcakNUXkyUGtOjjjASV8DnN2PE7Itn2LSx3vapuruvhJGYM46DHZ1EqIlJAj
	WvIPPjwvRVkUqTlMksXDHHndbMBP+4KecS1u9gn9boFGlUtpt/V0TU1K238wrtMrgCbAy/uY+3p/c
	mbl5vYJ6EuOTAkGZhSuK+nj0R8UURqdsNoUjn8+a9Pt7NE6NOLBhZhi8ya2FJbdk3rwAcw72LgQO+
	4c5DoCLtDJB1MNRdq8m+NeBYMWCV2IX+PaODvgIMc5DzH6zSMbSnr0jlLs95hI5qUP6JEmTSN4ngQ
	2WJzHcvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfh4-00000008VAD-0jRT;
	Sat, 10 Oct 2026 22:37:30 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfgz-00000008V9I-0HJ1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 22:37:26 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-67718201466so458783d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 15:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791671844; cv=none;
        d=google.com; s=arc-20260327;
        b=QKJq5gLnOu+x9MU5jsUMFgUOXHXaTw7RIs2MKHQu1HrwqH8qHufDWWwX6+y8vVovBL
         uhOY0B6bsjPoVn0RMzKu3jjNRprdn2a6Hnbe6A4HLnTIAkPi5DdNqNtRpcZ43VBQXQTj
         VQVXaD4KNeLhX+NqY1H3dSPHZI+cUFa+LJKAe8X9HH9uG33G8i+IugVI9eTuYyJ4kulD
         BByPeGvd8MLbIkSKaiRI+tqMUlh+pbkAKMjYBNm34M0jtG4g2kjue1B5n5S+TOs9PJkM
         0vapgqHwjHwzFRsX8+xJTbJQ2HPKrJXHbCqexRxxD87rJo0sQCdhYH0NLSTY3FkZZVkD
         lStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        fh=furPG3tjYwUW2KspvVAkz0ujzd4xx75BR1d8CwDnGgM=;
        b=IOnrhZlWj3OTS7Zl/iHI+2L64rkQdrkH+LNmR5gZ3/UAR7mp+QciYQAxQgGhw5DKO5
         JF6SppR/QWp5cxDMCV3d6LNK6fHQy+QaL6/0gM0bjVyegY8nR52/8iD8QomoysCDoKhM
         3FtYSj1ANvEhgsI3AVijYDT1l5Hx7aF8AthGKCuiXHJRD9ORwRKZf2CoANWld4mKGTx2
         irKla9A+E7bTi5FZz5LnQ2qY76BDG5ipwj2uFtv2CJcnvyBJukW0+0Nj+flvLTSHGPsx
         UrPzjJvBUawH6ubc2B+0s7F803xpgX/9NDkp2BtsJI35AW/Ko7o4/8r+TJ3SN0bHqd62
         DZig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791671844; x=1792276644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=mHYPcbl0XZRh06wqy1ZFYQREy299ltK7h6KvSsbrlCKPoDYXhyaPgXsnMaZoVGux5s
         ZdtKoWQQBHJ9WZ1wrnTgRccttGh/F92YdSq8JmAcAHRNIKbFoaNs1MhT7yPHQzwNzP2h
         q0ZqLu8TizR8ggbcx5z5ZSYTHFvOz6/nxP5yEpTnzhauTAN0MaxZVYe54UErtWUVlsbD
         0dk1zsuCoLjaa5WdJpVeOB0gcj/QzHHyKodUUazYNLXHjohjPJS8KRCABRXejMlQprYK
         /tqdLmvwgH3VIr1lui0BeFWsK2CGeRHpv8cS+arnoJP/pjWvtxoLtoGBp/k/KarddhDL
         OCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791671844; x=1792276644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaF1dXMmLkK5pzKGy77HkgIVspRqizj4NjSYijx6kNE=;
        b=Be+x41LrrPST/xk4/1+n8Rcjbnq40QscEFCSFSvRi3gitS7F+iEdceohfGG1M5x+CQ
         0PS3ZTeLCRAYVHtXx4k6A+qAdoowdvfSnlQr/8QtSXgqzmLdaZU2H9CSCvHUAhtc2Jx3
         0DUE8jYo3wD+eMjEczm4+oMZ/lTx5Q+qC8tC89NDATWdo1AuhVWsRVMswhqV7+EVZ6fx
         mk+/PcV4Dh1gUer1B64kXY/K3gxEKoSv6TXH4u3unGWWG6OwUPUTkFMmeuwoEuw4azQl
         xQhkHlRSCIJKKf7DSxFZiC+e1e7wCxXgXOUbXxogleadxUd1O3US5X2I4W03bICqrzMn
         09CA==
X-Forwarded-Encrypted: i=1; AKwUvBxsMa0+ljrS3bMvJfZfb3CyEKQk9NJSdqxJFLSQgFhKK9c5UdC/9lrL5pMG7XTJ5reQeQGm1wHQZiIQ8ZxWYsC8@lists.infradead.org
X-Gm-Message-State: AFq9FYKpgAw2gGXOAYXHX4sUYnPqIZaz+fPIoE9mcMFOZyVNtgqf3+F9
	SbT9ZLmiabnx0yV+6BM6ZLHzZK9LOfVPFdXGHZm1xsdv20eFJbAeAdpeU/to3ahW8szG5bTblXQ
	mXrGzxNlFULhoXs6YKpM/TpLWGq5nCgA=
X-Gm-Gg: AYBFou1XKIuTo5Y99E+XsaLHCUsz9cJjipuIrO0tW08cF29wTvAozFW1pRow4TQtaZD
	oWWNAyMBeQCtnRGG5qNnqjUhCebRTT2c5TJ+QRWL9SA+CWEa5ZyxbXUhWygc/WgWVk4yVQ6Ix/Y
	cLhiB8AIbZUUV5ACuLa9oXDa3JvtmtHdokG//PC51/Amvy+/GWPz9bdXR2f2McUtK+P//TVJeCm
	c55bCsIbYEQKciI5TxRt0l3evnqwYtLzdAji1PkmQtRbzkGDAbzJoWLQfSecJ5AO5lVBfs5J2vX
	DqdrVsg82GU1pQgycpbqe+VE/3GJafKkZ0Ho/W8ZU2ky+YuARg4xzo34Qwv6QsJ1eLBon0qnXAa
	zW0NSAtO+IkeM
X-Received: by 2002:a05:690e:4813:b0:677:c63c:ed3f with SMTP id
 956f58d0204a3-67936a45e25mr1411453d50.69.1791671843883; Sat, 10 Oct 2026
 15:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-9-tanure@linux.com>
In-Reply-To: <20261010105900.247342-9-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:37:13 +0200
X-Gm-Features: AclHuK83tYlY1Yg4pW9pjFmYK85k4ljD0olzP_yaTJsbdkiweyuLFexiO6_OaD4
Message-ID: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_153725_135912_F0EF677D 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Andrew, Hi Lucas,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    =
RX delay
> +#   rgmii       -                     -                     PCB trace   =
PCB trace
> +#   rgmii-id    -                     -                     PHY         =
PHY
> +#   rgmii-id    present               -                     MAC         =
PHY
> +#   rgmii-id    -                     present               PHY         =
MAC
> +#   rgmii-id    present               present               MAC         =
MAC
> +#   rgmii-txid  -                     -                     PHY         =
PCB trace
> +#   rgmii-txid  present               -                     MAC         =
PCB trace
> +#   rgmii-rxid  -                     -                     PCB trace   =
PHY
> +#   rgmii-rxid  -                     present               PCB trace   =
MAC
We have some boards where the PCB traces result in part (1200ps) of
the delay needed for RGMII (2000ps).
The remainder (800ps) has to be added by either PHY or MAC: the
(RTL8211F) PHY can only generate 0 or 2000ps delay so the MAC has to
take over.
For the three boards I have in mind, please see $ git grep
rx-internal-delay-ps arch/arm64/boot/dts/amlogic/

> +# A property for a clock the PCB already delays is not in this table.
Can you please explain this sentence (I'm not a native English speaker)?
How I interpret the sentence: The PCB may add delays but those are
implicit and not part of the {rx,tx}-internal-delay-ps properties. If
the delays added by the PCB don't cover the full 2ns requirement then
either MAC or PHY need to add the remainder, see fine-tuning below.

> +# It is either the fine tuning described next, or a mistake the MAC
> +# should report as a fatal error.
How can I differentiate between "fine tuning" and "mistake"?


Best regards,
Martin

