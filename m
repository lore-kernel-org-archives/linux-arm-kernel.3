Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F7FCA195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5D58sQUjXLLDfC4Cb+JyinMTeRDp8+6d+A4ebahMYHg=; b=Lr5lwhcFBpOE+8vrxBkHY4rMnE
	XjfM3eEvdJG1NrK2XHu0HJJ9mYPk3+w1GH6JprJHPeq3OyID/rSj/FYhVa6W51jang/i5ZC5fV2zI
	AN9lqw/DsXJSkDDLmB1Afub7ocV8wWWJ0qeTk9DyEncKF+ml0KrGsyFtDCscG5fDFw9y5vPAjoHEN
	KukmPwfifbziAC/NQdlZQLd3By1IAT6zFi12EoZglz+l94lj+Hrzwv9z8WwORD6l4WdlmERcijpkt
	sYQQxPlAq8PDUSVphm/3Is4dFU4d6Olzwl7PCkn+K4ZhMa7aufdI+pjDaGQXgnORcwcRToqMzKoeB
	neipsMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzieO-00000008CY4-1j8T;
	Mon, 09 Mar 2026 22:00:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzieM-00000008CXX-19PI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 22:00:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b941762394aso506681966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 15:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773093627; cv=none;
        d=google.com; s=arc-20240605;
        b=eXN3tF3pp6IwJ/5shfngzgLl9pswAXt2CHSJGXo/2YZvz93ViA0b7+UR+hAZ5qq+i4
         xqFPwjxwuim1O8xr1ON+qlasjfoweJEjKyUF+FQHdhI/4h8J1HMcOzMHrQwjN1NodaGO
         Ayov+Qit3qkXSbXhS/6ecrKgIVHfkacGSiVqxg7yr+kq+90XCSCDODsnoJ0rLo/Rekae
         2EHAgaosNxPvC7z8fkWPfibol/ZrAVST1fRCAwpjUYe4FylFyDMKZlxjvnzarGk5ulsB
         FM9vxSkPNjI+WfYTjt8kGM02jwJAcjkEBjNMf1g3603xZW8SDB9gS7bf82IkhwT6eIDm
         v6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5D58sQUjXLLDfC4Cb+JyinMTeRDp8+6d+A4ebahMYHg=;
        fh=DiGUcQTSq2HnIEeETW9hkdl10509PT2DTNB8ESGdnZI=;
        b=Tv3en7fMfU7f1mfq2GGg9FNrcDqjcn/bup72WrISomCqD6qJfTyXqETX/Y/bJ/qEsR
         JYCc10yXxfX5jjaWqeEKxjlmPhErtdRpy+agTPcKBYH72xFeQ61mUQOEaA9GQJyh1MMX
         M68BBUltnPezJjl/ZEHUE4rNVb+VCDe151GZ+A5lIy/kkIBF6FbBQ5hy1rYs/IE+00rp
         OG6IWgXFW24UrRDiW+mWeQETbR99Lx/Mi69mJnLIpRYGCiMt409Y729LLqJ1b/887quF
         KgZYnK0lUigfWqHY6bHQO+QLpb+5erdBlh1nlYt4Y7pjVHdprv9kfiA1bNN20SBoZltF
         VBvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093627; x=1773698427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D58sQUjXLLDfC4Cb+JyinMTeRDp8+6d+A4ebahMYHg=;
        b=LSjc0JUGGDrNHqA8cWPi9IxMqquTbmo9WgR+J1Sdcz/672u51nSby8/hNY0MLqRR31
         XDkchkKYfn2K2xAEyDuaHi7g8fambLPsjYLX8XYAsgCsSbq23P6BEeqrvJU+RPmZHvKU
         rY6DpRyjmSKEQsNY9939XIi+9GeY3MVPLI2ZtE7kCypkqlMCGM6Ywu2HTut4e1GNYogT
         G0MagASUPoza7VpRxkO8wSMuZyX2+QYBkZFBhvcDlqoWUM71fRaec6UBAFiv9sPaqbA0
         wn0H5Y62O3VSljZkYkWbDOEFsmrwS3dJqnxRmpHANKYejpvO7sDiGnbWvpCmt0JPTHGj
         K3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093627; x=1773698427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5D58sQUjXLLDfC4Cb+JyinMTeRDp8+6d+A4ebahMYHg=;
        b=p7cCk64Jug4ufUHLn2Vj92RsRbuf2uHGMj6HCitli7n0HwRJ7gNhGrJLJVyRo8qWcj
         TlevRlmXllM7uzfBlvLLCdnaxGnyzSjKsSXPCGxaGZ+lU6RoSxUNhuA8D/EZx2AuQc1c
         5RFg4jpIbS+AeC+q4DAAhfFx7j6i4ugOhAXg75LyfrYuRpiKltB0p4D3ZajLiosuI+sE
         KVKdqosF35UujUtverTRyAvegWW9z1xF/Zt8qBlTjQWEz9WMg6n5gYefnbmFzJfaEucv
         NONL9ENAU23+tN58Pw06zZ7nmIsqy7CtfaZBOJtpDW6v9HgGmGu+aypD4HyA3rPAtXvt
         o2xA==
X-Forwarded-Encrypted: i=1; AJvYcCX5f1Luw9kCeO0nStkAvC7rDUmbzow2qwIJwtT6D3w1e7mvet+DqjqpwU+m9lxv5aC0AdNwVZRzz5nveghyUuDA@lists.infradead.org
X-Gm-Message-State: AOJu0YwgJYO5Zbwfafq1KH/Peasno74ho73jE4/n83H8kjiVUrAGJfMi
	hYzYTLJ2KYF67UlOj2AC9jjaaeeUj8HYA0HHB+mIGlVP+ewKkgJ7ed2w3dsKz1RuhN+9gthoMh1
	jXyrLc1JjD+VTak0F/VO5dC5IxqGZyWc=
X-Gm-Gg: ATEYQzxLNRQNGH/Fl+sgmGLZGtQ8fNr1Al3r7UXP3a0LSLvj4gqSYXxYXj+HeBGy+wV
	btgw65G3IyCLf+9z+6Nyq77hHnCPKoNwy7+kjCTXW6g7gdbZI/jOC/ZhZsw4PlFPyv1xX7CV2q+
	oQcsox1V9+MZRUhpJQ+tn8mjmNPLzvgwxjXjaRaNpayHpKB3yclaR+piXgaByVDo175q2qh5n8P
	UQ0760W6tEc1o6/C6egwGHhMc+D7Aj1lxa9uDW+5Y5A73o6q3uNbFc3Kfb2IJA8QOMIE3QRnZUv
	ci7NAx9WYE/cNka55+YUDqg2CVWmc5UNu/ZcCvBBM07xhlqDJu49cuRfT+RunGEDGe2GuRvjuRk
	41ahYsg==
X-Received: by 2002:a17:907:72d3:b0:b94:21a8:f7d9 with SMTP id
 a640c23a62f3a-b942dfb47bbmr716289366b.36.1773093626764; Mon, 09 Mar 2026
 15:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com> <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Mar 2026 15:00:15 -0700
X-Gm-Features: AaiRm501bzkrH4SLjzi0bHRZdX65CXg0f05EKPvilttmHBQT5wJ5o03G2KV3H8Q
Message-ID: <CAKxU2N8_V7U11X18Ja+=tdYPWT6jnmM7bYt+5GHgeXAXOJ5cng@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_150030_333273_566348E3 
X-CRM114-Status: GOOD (  15.99  )
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

On Mon, Mar 9, 2026 at 2:03=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Mon, Mar 9, 2026 at 2:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
> >
> > On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.org=
> wrote:
> > >
> > > On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com>=
 wrote:
> > >
> > > > Use a flexible array member to combine kzalloc and kcalloc.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > (...)
> > > >  struct msc313_gpio {
> > > >         void __iomem *base;
> > > >         const struct msc313_gpio_data *gpio_data;
> > >
> > > Do you wanna add:
> > >
> > > const unsigned int saved_size;
> > So in the code there's
> >
> > for (i =3D 0; i < gpio->gpio_data->num; i++)
> >
> > which is equivalent to match->num.
> >
> > __counted_by doesn't support pointers AFAIK.
> > >
>
> This is a regular flexible array of u8. It should work fine with
> __counted_by and I too am in favor of using it as it has become
> standard for flexible arrays.
That requires adding an extra variable in the struct.
>
> Bart

