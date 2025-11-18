Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30319CED265
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=; b=U+1qsbXSXxG4xB4vLGK9aHkaht
	bfsxUUBIym9UxLuBsJCPqpItrQ5xwc2L5aoA2ZuD0X+f3Jj5MQsJwQ5bgM6AINhiKEXyCRmQGEasn
	wtADS1TB/NYuvQG4Rhiuf5G6lRa+ZmEuyO1CEX1mN77DhbDE0nhaUnZJxYNFj4VfFvzQQir1MT0j6
	9WEiageSVKCOGCBLw6+VdZ8wOZbulFjuK7xZXIR86PJqeWiI0/YY4VWFOBXPMWnC7HuvX5Z4r5ndz
	/rhE+phePvcHQooIZbB+uzD0tD2mIUh1OyYYdUrcmaOZcL0IJHnbrKngTHh0wko0kb0Pw6kzF9/Gf
	9v8FNHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIiX-00000000Dw0-0Xyq;
	Tue, 18 Nov 2025 10:13:45 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIiU-00000000Dva-431V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:13:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b737cd03d46so429878066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460821; x=1764065621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
        b=emIKgTa2+uyelS7ohNCERcpYeRwyZLepihEYZefcrPz4iYWo7Ts+Q7NRYRwsqdaM68
         JS5lJnHdl4glzsJ0At7qapC5/2KlBKzZmZJ2JFwNaiN67II7/SdCurg6Pxkk9YOiva4T
         ixxsONDr36/HJKVMqgDBclPE+l/qgK0JZViCBU+I7Yq/8/9rClVNOjti3xiTQHbiEBEI
         s79IyBD6bKSGAc1PKEf5+A2lhEsBmPFfOUMUPNU8Rd+C1YthENe/kNVYY2Ji/nagTARR
         5BWnDS2Iwlv+hHjvcbapT05PmJcv1FRJ2bdfh7SGQ3jiNUSVNZdvtBEXb6Mq6b+W4By0
         9xNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460821; x=1764065621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFefpdoMFyMi27e5cexLCleGqXmlmnauCcO0f/wKf9o=;
        b=DCsAVUvs92LlPaa9yCAbz/nKn/y1yZgOzMCDi2oSylak+ubDIbVARHX1YnpoJ649t4
         sTCBqg0vc3xgg4+NfYob8Z40wYBSpR8lj+bvyVrmYdhDFkzFfnSvjNnakkbzEJJe5GVo
         8O2M8iLCHkpJIToH985d1yPyBFaVvFybX6JmBUTDolECrot8qsNzXvs2GrlhoToy3HTG
         8UHLmC6lLVCCGycCHjGKBo4IPlksoXZvPicwSDSK8FYlZZYv6bivq4ZwH5nhkd/5PJZf
         eXAGBR9pzOlrFPK+moVxE1TOYtz7xgfrc+hvDURC7cyQLX5OoDfMemnjkikeOErvEyzq
         4eMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvphB8xlfOUvCltl1H6uFPjb4Ut7QGEY0gFi60zsrm4F9qtOQ7nUC3DP9s0cXRskQKmWLgXsZGUclgfxjoZZT1@lists.infradead.org
X-Gm-Message-State: AOJu0YzYfoR2Hc2zOwXXv0ruNCtkjxPrDSP2UjBDnm9plOd4N/w5pWoL
	kBJ+Mo2QfuVjtMxL/rgyoFZkLkPr62E2cMquCVekcCr5lGR3/Qf6hiDuKwgol4g4iaYZtIOjNQL
	uj+Ed3zZG0hF4V+/BDjGialOI+YlWieI=
X-Gm-Gg: ASbGncvjGGEsI13ZQXCM27sjvNgokNPcY1VDorOAF3YOO2nFg73ijzZBg8RohvUaEpn
	yqzWCQKpnTMeuifmSFVYl0zk+obRAXGKIXc9TBUFbpqGuo113X5fkPNUFNgiUUAU7O1JsUs6aeE
	bnMS8IQVJyHXtm6fYMLmeAOmotPon9vZbDOvg/oc5CEUJGPUrq5j0WgcwBAB7i5OI+nmuV0I7aj
	59v4K/0dQOe1+1xDcxfDOrVGfBm9/of3W7ocdabNlwwXBBAWWuaumAuoT4Z37HZx+oz478JMECM
	W7i2CSmmA6SNaz9QheteYdgGQ1rzBY0fe3xxHyEl7HiA07GKww5QGCrFJ3yo
X-Google-Smtp-Source: AGHT+IEJTl+Y0nxnsqFxRaoeNJlW33h1PhyfMHfP+H08fkNstExAh/KMDUENdNIJwaldyRxp9vjkOUQWvebpfsJzkrQ=
X-Received: by 2002:a17:907:961a:b0:b73:1baa:6424 with SMTP id
 a640c23a62f3a-b7367bfbedemr1652125566b.55.1763460820308; Tue, 18 Nov 2025
 02:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org> <202511171230.F83EE85D0@keescook>
 <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 12:13:03 +0200
X-Gm-Features: AWmQ_blpLOjcJSfageDQJ0p1yverbXLRzjhug3ph18HdqFCZGe_i141QG5p4Fcg
Message-ID: <CAHp75VeqaZ9BOYaEDdrShtZ=5o75HmeKBHv9dpiYpQLudCr2Ow@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] string: provide strends()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_021343_019193_76A9085F 
X-CRM114-Status: GOOD (  13.00  )
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

On Tue, Nov 18, 2025 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Mon, Nov 17, 2025 at 9:33=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> > On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:

...

> > > + * True if @str ends with @suffix. False in all other cases.
> >
> > Maybe added "empty strings never match"?
>
> But they do, please see the test.

I also think that "" =3D=3D "" (on the same page as Bart). Why should we
make it different?

--=20
With Best Regards,
Andy Shevchenko

