Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107DDFEE4EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ouE7c527BS2v3HOI8uXoCrqcS3QLeO5E4Kjh3MX18VU=; b=OlhwNPf9bMqybqrmpTCk8SJ9LM
	+3mFc53aGtK1/nfv1W8LqF9DIGZZxJWR/n3wEWxtY36Mqk+bxRxf1qEd6/L9CDjZc0d2T9RmQrG8a
	UklF8gzzDHq9nlSXFe9gdlKmfq6FVOnJyNKW0+XaULP1xl9N7/6aapjxsJjdZK8QQNQ1UQm3s2Ul3
	QsQ5nzlsg9WxVhIy9QoK52UnlbrarxlwuiGhbGvsP9ZkkNyknefaTCiorsHTGfK+u/RWzTaz4cH6V
	U2yDPiyPM2Y5m6jKz9Mdui8Fi7g2+/KsWF80cP306VtsZBT1J1vtJCdEeE1OBKCScJNngTySi7OTl
	E0aXLlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMSt-0000000A0Q5-27n2;
	Sat, 28 Feb 2026 15:42:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMSq-0000000A0Pc-3zwq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 15:42:46 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-824c9da9928so1752274b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 07:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=localtargetshows-com.20230601.gappssmtp.com; s=20230601; t=1772293363; x=1772898163; darn=lists.infradead.org;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ouE7c527BS2v3HOI8uXoCrqcS3QLeO5E4Kjh3MX18VU=;
        b=iOs5jQjIm1vpc+SnpgAK0wmSsXQDIvhqZjdSV4KGzjqd4lweRRXvgENTqQ/zfLA11e
         OlWTz2VpU+8nhFwyiWP936xPU1BBogpSVgSfX2la1hLi7CjjtIBulNbRkNe1DnNKaV9m
         Fq1mGyIoSqBYCXyhCtyMgceKBY2g/5yK3myIcTEx3s3Sf1CRuCRzngUwHh05ypq68wiy
         kFikfJ590GzkCQ4bhZIVmpEy9OUlS0kltJBTZHYbfpOwcXXv+PumLXmWwD637Gz9Fv1L
         G+NhE94YleeGEW6m+NDXeMFGRRcgNm/A1yqv16xEOILA9hriRYVfEms6tr6oJohHH3B7
         Tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772293363; x=1772898163;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouE7c527BS2v3HOI8uXoCrqcS3QLeO5E4Kjh3MX18VU=;
        b=tO1MJ3PyDWCPZo+XDVbRIYYjnAE3EP7uie/p8F1J+Dge6MfGRRjLP1BGufXDlDEAUZ
         jyUtwg3YHHnBdrHYNTLgRst4IKrr+JWbRZuiul+r8X4Eqqo9AlMMEgMS3ni+wBRShgQL
         8ogIMwL93ZVI5aYpe9SBGZoeIsCMTdz2d2BM5OfW83c9hhx+eIs/ppUqDcu32BcLLppj
         jE1Ew4OdIPB4IDbpqCody+PZAUmRwp3an2Q+r0uBq2A+kgkuUPFXccA89M4cNzGk0JD/
         5lT1MvFTTBr24jZ+RfY0sZ2Lpw2Cv+nzNVSJpNZYogZFTRIqWuxjh1BQ/mPbe2Qjvzde
         kYMg==
X-Gm-Message-State: AOJu0YwVCxKLeaP6SD8QKmOs1LrxuwOJOv9CKVoBHcujJbHmVbJWZN7C
	qJepee7IeIC8O8+QF9ME+vndIDHwM+r8DwChZh+9I/mtmUBYxFCODWy5+iCb4o8c2sEAck+zXkB
	svjOiL3g=
X-Gm-Gg: ATEYQzzFQFHXTjF7Q9JPPBhOYsL4keLEgUQsbOxTp1+rgCzqhRA9qrp3CcZnrlkqfwx
	h+cP8tp6rFj1M1Yk8NdDuz1tCYDlOUMYRVUcupLiYJGiS9fphLvUwV18bt2BFKvrvGbXw6pNyOS
	q+Qx3GQgAWnsKbLNgP2a8SYdd4NaHZQPYqdgQ6iHD+KtP1w63u2LNnttAoK5fDv2JI+QCKgPoKq
	FKSVLA0N4DrI4WJSxAkJJQxy5e9CTAZ7fIZONFDVR3L0lWJCqFcLd/Oe32h8mfB65iHmgF/UGES
	xiNNZXUrDCM1j9DUYzuRlOxOBgorcOgy4frTw3kU0aMtJppOTbSTpiMIyqzsUT0VTkMacsi4dzt
	wksul88W30uKPsNB3bC7W6q70oks2vYPtN/Zk2mkNCxkS/0sPak9Vtm+fsFtGINQdoI/gXHcYy5
	OWIkzZxsKFyp/clqV71WOuDaR3t2sU86zdLBolyDfUQPnjXebqL0XHTXqZZT27tj4t
X-Received: by 2002:a05:6a20:94cf:b0:393:dc6b:a10b with SMTP id adf61e73a8af0-395c3b0f6e6mr6415707637.44.1772293362929;
        Sat, 28 Feb 2026 07:42:42 -0800 (PST)
Received: from DESKTOPO5PKTIC ([2406:7400:11d:7944:b022:eb99:128b:bc27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c2e4bsm130159535ad.32.2026.02.28.07.42.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Feb 2026 07:42:41 -0800 (PST)
From: "Caitlyn Christensen" <cchristensen@localtargetshows.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: OFC Conference 2026 - Lists.Infradead
Date: Sat, 28 Feb 2026 10:42:37 -0500
Message-ID: <150401dca8c8$df92aed0$9eb80c70$@localtargetshows.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_1505_01DCA89E.F6BCA6D0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdyoyNp1Szz6YAmRTsWj0p54MJdTYw==
Content-Language: en-in
X-MS-TNEF-Correlator: 00000000B48EE13E633F4E45B250D8DCD108A12D44895700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_074245_254564_BCA92474 
X-CRM114-Status: UNSURE (   1.30  )
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

This is a multipart message in MIME format.

------=_NextPart_000_1505_01DCA89E.F6BCA6D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

Would you be interested in acquiring the attendee email database for the
Optical Fiber Communication (OFC) Conference 2026?

 

Attendees include: Fiber Optic Engineers, Optical Network Architects,
Telecom Network Engineers, Photonics Researchers, RF Engineers, Optical
Systems Designers, Network Infrastructure Managers, Data Transmission
Specialists, R&D Scientists, Product Development Engineers, Technical
Directors, VPs of Engineering, CTOs, Telecom Consultants, System
Integrators, Optical Component Manufacturers, Communication Technology
Professionals, and other leading industry experts.

 

Please let me know if you are interested, and I will share the total number
of attendees along with the pricing details for your review.

 

Best regards,

Caitlyn Christensen

Trade Show & Events Data Specialist

 

Note: If you are also interested in upcoming event lists or targeted
industry email/user databases, please feel free to let me know. I would be
happy to assist you in finding the right data for your business needs.


------=_NextPart_000_1505_01DCA89E.F6BCA6D0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IikPAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQOQBgAkDQAAKAAAAAsAAgABAAAAAwAmAAAAAAALACkAAAAAAB4A
cAABAAAAJgAAAE9GQyBDb25mZXJlbmNlIDIwMjYgLSBMaXN0cy5JbmZyYWRlYWQAAAACAXEAAQAA
ABYAAAAB3KjI2nVLPPpgCZFOxaPSnngwl1NjAAALAAEOAAAAAAIBCg4BAAAAGAAAAAAAAAC0juE+
Yz9ORbJQ2NzRCKEtwoAAAAMAFA4BAAAAHgAoDgEAAABNAAAAMDAwMDAwMDQBY2NocmlzdGVuc2Vu
QGxvY2FsdGFyZ2V0c2hvd3MuY29tAWNjaHJpc3RlbnNlbkBsb2NhbHRhcmdldHNob3dzLmNvbQAA
AAAeACkOAQAAAE0AAAAwMDAwMDAwNAFjY2hyaXN0ZW5zZW5AbG9jYWx0YXJnZXRzaG93cy5jb20B
Y2NocmlzdGVuc2VuQGxvY2FsdGFyZ2V0c2hvd3MuY29tAAAAAAMA3j+fTgAAAwDxPwlAAAADAAJZ
AAAWAAMACVkCAAAAAwAQgAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAALACmACCAGAAAAAADA
AAAAAAAARgAAAAADhQAAAAAAAAMAL4AIIAYAAAAAAMAAAAAAAABGAAAAAAGFAAAAAAAACwBBgAgg
BgAAAAAAwAAAAAAAAEYAAAAABoUAAAAAAAALAEKACCAGAAAAAADAAAAAAAAARgAAAAAOhQAAAAAA
AAMAQ4AIIAYAAAAAAMAAAAAAAABGAAAAABiFAAAAAAAACwBEgAggBgAAAAAAwAAAAAAAAEYAAAAA
goUAAAEAAAAeAEaACCAGAAAAAADAAAAAAAAARgEAAAAYAAAAQwBvAG0AcABvAHMAZQBUAHkAcABl
AAAAAQAAAAgAAABuZXdNYWlsAAMAR4AIIAYAAAAAAMAAAAAAAABGAAAAAOuFAAAJBAAAAgFIgAgg
BgAAAAAAwAAAAAAAAEYBAAAANgAAAEkAbgBUAHIAYQBuAHMAaQB0AE0AZQBzAHMAYQBnAGUAQwBv
AHIAcgBlAGwAYQB0AG8AcgAAAAAAAQAAABAAAAAwrl5wU8TEQYZigTOGdPAIBQD+gCkDAgAAAAAA
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
kAMQBCCb0pghBcD9GVB2CJAqYO//8Q/yH/Mv//Q/9U/2X/dv+H/5j+zv7f//7w8DbwR/BY8Gnwev
EG8Jz78K3wvvDP8OD74/GyhCmOH3AsFOIE8Ac8EPwh8bVX8//xH/Ew8UHxUvFj8XTxhfGW//Gn8n
kjnANrBdYJlQYUCZwP+Y8c8QoYAh3yLvI/8lDyYf/ycvKD8pTypfK297Yc7hAcC/00DIkPvQDh/R
r8MXRdSw/9nxzoTPuC3fLu8v/zEPMh//My80PzVPNl83bxufDv8QD/89jz6fP69Av0HPSo9D70T/
x0YPRx9LDDE0OEwQWOLnddZc02ajMTFnoneRVK93e2FUIMZgOszw/AjfwW/5mI11cNkxmdLUodUh
0BN/14Cb8WihAdCZE+FWmvIv7+Fgw9GbRsThcPrUoVDG4O+bwKFw/pL7Ki79kpfTmGH5/iBwcN8A
YYF5MdAh/BPdmUFm4TGZ1pnAZzrAmzP9Ajhi4WDEkVPA/wCasB8Q/wM/TB9NLFXsdHBvwlcRIG+/
VZNOD08fUC9RP2puMGiBzi940Wv/cB9nNVbRIEB11DB5aO43ICE6wlJAfQF3gAAAAAMAFhADAAAA
AwANNP0/pQ4DAA80/T+lDgIBFDQBAAAAEAAAAE5JVEH5v7gBAKoAN9luAAACAX8AAQAAADEAAAAw
MDAwMDAwMEI0OEVFMTNFNjMzRjRFNDVCMjUwRDhEQ0QxMDhBMTJENDQ4OTU3MDAAAAAAAwAGEL0L
W6MDAAcQaQMAAAMAEBAAAAAAAwAREAEAAAAeAAgQAQAAAGUAAABISSxXT1VMRFlPVUJFSU5URVJF
U1RFRElOQUNRVUlSSU5HVEhFQVRURU5ERUVFTUFJTERBVEFCQVNFRk9SVEhFT1BUSUNBTEZJQkVS
Q09NTVVOSUNBVElPTihPRkMpQ09ORkVSAAAAAAU/

------=_NextPart_000_1505_01DCA89E.F6BCA6D0--


