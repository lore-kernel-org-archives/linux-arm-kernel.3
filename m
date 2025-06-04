Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D18BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 19:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v68ILt8xt28THMlmyuKMfaQcpvhx4IXAkUL4p7ZYZOA=; b=sM7cXLkG6HuBknRzhppjypRoNd
	XETkC6TTznv5+ZQA1CgXHE0TXcOg11FbRX2Jf2QQGbVn+OJnbdVycLbKg4D9IbNGnhRWukYJY+bPD
	XDwd0H7+a27f1uIC7v5Zt8tZfq3MYgHQVuFU5xmIxhMMfAO94BTk1Fd8X9wd9P0R6FRxH7vYHjq3w
	WGyAEWASgRI3A9P5x27IwpvfMvhIzC/S1LrRMoR5KX/m5kvJ0QN+qKhtf4mMQsUgmw7ityO10Krw4
	7+W+4L2pcPCj8IaxLsfpwjR1tkfshKH7vKFjy2D6cSVbm4dR0elZwArGPXwGUm3YoY+TngdLDuisP
	pQQ3IIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMtZh-0000000E4oJ-3UY3;
	Wed, 04 Jun 2025 19:14:57 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMtXa-0000000E4fc-3Uq9;
	Wed, 04 Jun 2025 19:12:48 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4a4bb155edeso1487181cf.2;
        Wed, 04 Jun 2025 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749064365; x=1749669165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v68ILt8xt28THMlmyuKMfaQcpvhx4IXAkUL4p7ZYZOA=;
        b=QcwJmAFIuWufOuwwGgfffsFIhR7uSTRh3y7o9MctWtrU1WWyVSYH2dzMWBl7B5tQl+
         4JY1Y5f8RnwqxUTq7x+exyCxutRc4aaDHoASAP/U9LGaAbN4jQCZoSEI4JY+8CZmW2Fo
         8o+1e9poO6mws0LXjCSnv6dGJh3q49JdrM2mLQET9eiJW22NsMTZf1ZYmYQGBAWjWTxx
         8kcQKGCtfAlZxS7qDiX6hi0d/IOEznUgfvoC2WGuHeoe9kK92P8dmwjXY9kc/5V7jmRv
         awJp5M93ioOrUwf3WD5TlpJPmu2ChFGRmM1bpMFg4RNUYpRDfllYKmPAKs16EOtDadaY
         iECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749064365; x=1749669165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v68ILt8xt28THMlmyuKMfaQcpvhx4IXAkUL4p7ZYZOA=;
        b=Abiyrj8iZdzrMaUmanwXy5yG6BG3p93Gi8NkseVRwG3HRyF17HBpZIDcwzmsYifNql
         MUvV70+Upb7LQN/8TJUIYJnUjciAmH/eSa8v1fyI5IyIFLP6j97+iWWxcpHCv75oCzFh
         vVs2E9eRGd//WL1wByGP1mMhG0YECsMlaS87/3z4QnrA1gxw3axY1d9RKkp8oSvYQDAr
         KCx/ymEhvfCWds4lcKsqprW2T4Rndm2Ysjhts/P2b215uGRvwBy0/ZsOKXEiyDqiRMZu
         fwwLPoNUHOQZBkxGnFGQBaE57eLw1NHz8F2ea/9UC3d1Kjggn0kdtV1lFSwhJmkQnYxM
         uoHA==
X-Forwarded-Encrypted: i=1; AJvYcCVNurIIZb1+JFcPhzCItJg/EeqDE9Du0p9hWs3YMi6lk8hcI0wqgnYlB9zClNZ6CQMgIWRiMmFTIz1yeAfbsr8=@lists.infradead.org, AJvYcCXAnly5ohM/642lnOQFk20v6T1M1N9RrAKNq7FLIolI7NAMGqwxKqTQuv8KqpF/iXf7nmyQQ/WEWjmxyRO5vv5h@lists.infradead.org
X-Gm-Message-State: AOJu0YwNv+aQwQlF7hcjkV0FaByMSBK8g/XMtl5o4G8AOvfb5ROFFOPc
	0O7TUM+7JrsM/9TQSYQCGpBB/cQKjDOSaPMJg6xNSW0NyBr+GdMRviy4+tC9M7XkkSSCtH6ZSSL
	AuJ4JF3MaytUpoyefX+loNtTY9Re5eJA=
X-Gm-Gg: ASbGncude7E2u659EJMu8mBIPZdiRR1hc15fs2zblxT9GR3ZuEaHW/k5xX2fACRkQir
	eNYJ0Hmkeb/3PvaLFr0F+gY8RDmHjDS0Lv8hL1DE4NwlTsNSnNn6OBecnXUwieZ+RZR6bJ8Xfru
	NhDG2lzr+YqvPa+OAV7YEEZfMEXm/psp8CCGmR4GjssGdXkGPYIq5jNoMNsHSlD7eGVw==
X-Google-Smtp-Source: AGHT+IHkGcI9KV0dFs+7Hj/zh+wdAmNhv6TFy7eW9sMjhV5X2zUe4MTyLbGWK9esEy06HGIELxjaKcjO6066Mlf9nY0=
X-Received: by 2002:ac8:5cd5:0:b0:48c:c121:7e27 with SMTP id
 d75a77b69052e-4a5a584733cmr74376181cf.50.1749064365064; Wed, 04 Jun 2025
 12:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
In-Reply-To: <6656934.DvuYhMxLoT@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 23:12:35 +0400
X-Gm-Features: AX0GCFspbBIHwcLfNzc6-jDHvamdNprrbgOXqKsRv_8yqqyAsKIYJM_cipXfo4o
Message-ID: <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_121246_892953_613C75FA 
X-CRM114-Status: GOOD (  22.96  )
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

On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 3 June 2025 19:01:13 Central European Summer Time Alexey Char=
kov wrote:
> > List both CPU supply regulators which drive the little and big CPU
> > clusters, respectively, so that cpufreq can pick them up.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++=
++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d6=
77cdc98fb50353418 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> >       };
> >  };
> >
> > +&cpu_b0 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b1 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b2 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> > +&cpu_b3 {
> > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > +};
> > +
> >  &combphy0_ps {
> >       status =3D "okay";
> >  };
> > @@ -215,6 +231,18 @@ &cpu_l0 {
> >       cpu-supply =3D <&vdd_cpu_lit_s0>;
> >  };
> >
> > +&cpu_l1 {
> > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> > +&cpu_l2 {
> > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> > +&cpu_l3 {
> > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> >  &gmac0 {
> >       phy-mode =3D "rgmii-id";
> >       clock_in_out =3D "output";
> >
> >
>
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
> > so that cpufreq can pick them up.
>
> Fwiw, even without this patch they're picked up by cpufreq-dt for me:
>
>     user@trixie:~$ sudo cpupower frequency-info
>       analyzing CPU 5:
>       driver: cpufreq-dt
>       CPUs which run at the same hardware frequency: 4 5 6 7
>       CPUs which need to have their frequency coordinated by software: 4 =
5 6 7
>       maximum transition latency: 40.0 us
>       hardware limits: 408 MHz - 2.30 GHz
>       available frequency steps:  408 MHz, 600 MHz, 816 MHz, 1.01 GHz, 1.=
20 GHz, 1.42 GHz, 1.61 GHz, 1.80 GHz, 2.02 GHz, 2.21 GHz, 2.30 GHz
>       available cpufreq governors: ondemand userspace performance schedut=
il
>       current policy: frequency should be within 408 MHz and 2.30 GHz.
>                       The governor "schedutil" may decide which speed to =
use
>                       within this range.
>       current CPU frequency: 1.61 GHz (asserted by call to hardware)
>     user@trixie:~$ uname -a
>     Linux trixie 6.15.0-11173-g546b1c9e93c2 #2 SMP PREEMPT Wed Jun  4 20:=
32:52 CEST 2025 aarch64 GNU/Linux

Frequencies are fine, but I don't think the more power hungry big CPU
cluster gets any voltage scaling without it. Once I try to load the
system enough that the governor decides to bump the big cluster
frequency up, the regulator stays at 850000 microvolts, causing random
reboots when the whole cluster starts starving. With the patch,
voltage oscillates between 700000-737000 microvolts in idle and jumps
up to 950000 under load, and the system seems stable.

Here's what I used to monitor the voltage (there must be a better way
to do it, but it works):
sige5 ~ # watch cat `grep -r . /sys/class/regulator/*/name | grep
vdd_cpu_big_s0 | sed -e 's/name.*//'`/microvolts

And in another terminal:
sige5 ~ # stress-ng -c8

This might warrant a note in the commit message I guess :)

Thanks for your review and testing!

Best regards,
Alexey

