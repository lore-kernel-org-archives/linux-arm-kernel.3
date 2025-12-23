Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F634E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKwDK4STszGV8vbOMc3KlFzvlsT8tw8vcmmy9EXfXY4=; b=ljFJSoMDW6E10oP6hI/2QogwPM
	n79LUHvEDxrrlPyf9RASCWE/fMCWFg+UQDhGFQydjBZKCf56mBItzragF6Ox/KnQqa/JsLxh0/Fqk
	9S6csLlQ4VxF55V6DBgUTGWNibL6Ux6xmqSNg2C3xuJjty6akxu53JmW3/IGwU52D3fL+GvQoJXAn
	w+C0DmuZcpLTPhOdo8Q94Ibkhcm7TOFrZmsBp7UJmvOS2ALZ6VqpeiATDlckjDvXZTA/ewElCDJVy
	awbAs0J5Cw8GepIWOn1G+CxinBuieBw8k/Qz6Mhr/xz4v3HxKbzZEPNsyrTYuZ89h6T39W3dJ9Dcg
	bhdW5RSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2uZ-0000000FZFV-0SQM;
	Tue, 23 Dec 2025 13:58:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2uW-0000000FZF7-3aFZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 13:58:50 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5957c929a5eso7235013e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 05:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766498327; x=1767103127; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKwDK4STszGV8vbOMc3KlFzvlsT8tw8vcmmy9EXfXY4=;
        b=EUFRv1684HEaei9vGrKMGywnjYwaAs1rV+m9HSKldD8/KjUwpBIbZeHB5uec8+V2vK
         OvFPxYL/nMBlikr0Hvl8UKntMh9PL2fR233PGX6Z5FqbK/St1eONbfntpFYL/OngsubK
         GXNIMqelrA92jBBDJdjp3yLE98bjJvID49oWjAtttGtU/MmieHE5YOkrL9/NerA7Yic5
         ClCTHBP+MWdHqZNcpuw2JnH1BviLombv/OkHQjz37kmogUB3m2zKzRZ2yX1cynwIQSjp
         JkQ64usiACUTpYgEg++gs0Lxm1CAi4wORXXpVAhEpYPzW+ALQ86KchvIz8r/kXtM/nTm
         6jRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766498327; x=1767103127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKwDK4STszGV8vbOMc3KlFzvlsT8tw8vcmmy9EXfXY4=;
        b=ltKj8lA1YeH1d9NMZRYb8TjEsbHeBLqePL5uGpqewuoXpOIADCyRhwT5eIu8Y4t01R
         PTMNk3fItik1OoCttyJkb1PEg0EJBZXrZQQBiJ6fchyTkCNTUMJxtMPICtHpe4CMOHoq
         wTaWW2gk0xNEbQ7BKAO7x1WMKjs2pxUhNRjIoPaArS+lXyrZvnaY1RfXZIHVlAEnKHc6
         FFrYiuuMSuKnkfUKJ7UXI4axxhdlVrMtJ2ZZ6QZ/3QaFCZ+1CZIbHn2HtdRLicbx0+Ry
         xNqqt9NkTCauQ/MJIk35B7GFTWm8PT25ICnItLmqM6WZMPzNyYIXa8Qm2BXgrChEOEjo
         /Vug==
X-Forwarded-Encrypted: i=1; AJvYcCXtNCL/j+Kr4ivzd66JdFjDwBD4T+KWuUoH/njER1eFgvnkF5ds/Z2taKUDjybEXPzWL2hLiLMrtVIU43XBVgCu@lists.infradead.org
X-Gm-Message-State: AOJu0YyBJGW3lLuNdgsjq8+8ixm4prgzq7V7Viglo+evwlrcnUIqqaw3
	gdDXl1Zyy7YaLaIq4FY0AyePE37NGPWVWQsp2O8ghGlcNX73uOSg9PHB6fggZMGejzM=
X-Gm-Gg: AY/fxX5KKhuI8HvdirdgRsgSvy/2l+JnqJZsR80Uq88CJlr+1dUcvYA10ktL0XkJdn4
	C4CeSrK5vme/1IXgALYOYowftkFQF8wm6N2ble1jxQfMIzyZI8eYkH+OD2fmFFTfc28nUa5Ya1o
	29cn4ik4wrsPkCIEz8D5sXdgnHnM4EtiHRaUWeVsRZn4oa3XrujELl/i0WbTTunrNnVINJCRRnx
	xOLU1ziUVtc+QmzU7O5B2ay+xDYoMA1WQOvyp8EGUfTUMDQbD+ffhCSfLHS//wPCx9eiJSpGbxA
	5XnMgJRw9sHRLckUWtTo0eIiWfOc0cjmByPQz9hEZ4lw1eQwsaibnQL+SXC7VPoaiAGQdZ6Y3d3
	Zc0mpg0NN6FGXZpCpfSXcOhuX06er2wBzJ/QsWuoFPsJ7dmA/8qw25cCp7R/bi9gZ2B+Wh+BsBy
	+k7zTPreY9njnDYo09EowUz41/PNw34w7/UcwUn/hUa7rt
X-Google-Smtp-Source: AGHT+IFv99Ej3GkUrXZadn9xCMt2v/wJnf6A79YGb01ppx4vbKEg0EBBNlfipL3lHtnz1hRVMbz/WQ==
X-Received: by 2002:ac2:4c49:0:b0:594:2a0f:916f with SMTP id 2adb3069b0e04-59a17d5dd7amr5109990e87.43.1766498326586;
        Tue, 23 Dec 2025 05:58:46 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b27194edbsm485807e87.53.2025.12.23.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 05:58:46 -0800 (PST)
Date: Tue, 23 Dec 2025 15:58:44 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: remove SLIM_QCOM_CTRL
Message-ID: <aUqgFCgmBy7H9yW0@nuoska>
References: <20251223134807.3543642-1-mikko.rapeli@linaro.org>
 <c06878f7-bb93-4de2-b54a-e97fbc1a333e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c06878f7-bb93-4de2-b54a-e97fbc1a333e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_055848_925021_19C3C822 
X-CRM114-Status: GOOD (  12.49  )
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

Hi,

On Tue, Dec 23, 2025 at 02:51:45PM +0100, Krzysztof Kozlowski wrote:
> On 23/12/2025 14:48, Mikko Rapeli wrote:
> > It has been removed by:
> 
> by commit foo bar (see also checkpatch and submitting patches).

Ok will duplicate the info then.

> > 
> > Fixes: 7cbba32a2d62 ("slimbus: qcom: remove unused qcom controller driver")
> > 
> 
> Drop blank line

Ok
 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> You anyway need to send to proper mailing list for this soc (Qcom), not
> random folks.

Which proper list?

I sent to addresses reported by get_maintainers.pl.

Cheers,

-Mikko

