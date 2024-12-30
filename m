Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1A1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxrdItGBJxNke8Qv4t7NexAggAehgjNYz5OrhIGSKdg=; b=xZjJY2PmgRjMnh0H/Q6Jhy5yAD
	TwmlCk1xoKunTgc8EymszSLaRIRGeALD8PbGgD1AZSzf4jZm2BeiehdTNUy9zM6RBBEM8YlUmEXl5
	Vv9/as/bM5hEw+sH4976F1uCldNsIRJVhlzBY19Wy/FX4JYOOB+VbJY1S7VSiFFeeQV4M/RdN939u
	/BkiCaoNdx4KequhdF91v1kKpWDlmwyJNLheff6iVqXD97k6TUrPZ/kzRZaAkCCF3vEt0TXoFmcsu
	wGiPbKJP2DVtXXAz5GbUYbm3B9SRIYlcbc6SM4VwPn42L74ovf/k1+5xVVJNzCeNJKM0VmhU1GhZU
	NR/D1ZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSK6Y-00000005c7v-0z9X;
	Mon, 30 Dec 2024 18:03:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSK5O-00000005byl-0Vr9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Dec 2024 18:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HxrdItGBJxNke8Qv4t7NexAggAehgjNYz5OrhIGSKdg=; b=G6hyEHGIA2AneTkSqaGxqZ3bg+
	eE124mOZfxT4XKjj1teKoa9cTPG+mv/gVtu0JLLihvyE6RVskyqEJnGQVx+O39mIj0kXaPKDX+KP1
	u7nLrwImQGbCgBMqWb+SCa2HBe7eCb+ngrp9SPllYai95RbM2dc0/ssOR3Rwnoj+S6Xa+NVSTRafw
	ZONgGCe67mJzN7YEwOKNNau5fTZrekoSsh4ytGVXEoc1v8wgAdbhO6+Ygr6G9O1tByR+JYDbULu5H
	zuFoUB1r7oAbP8XSHG65DFmCJVU0IFSnj12Fi+TZdOL0LFQ2a6dy1xYWXx0NKjik1JV9wIsWDEzS6
	6cMNMP6g==;
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=u09cd745991455d.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tSK5M-00000000Nu6-0WiX;
	Mon, 30 Dec 2024 18:01:48 +0000
Message-ID: <ef7592ced999db8f7affad6814e4bbfffe8d1853.camel@infradead.org>
Subject: Re: [PATCH] irqchip/gic-v3-its: fix raw_local_irq_restore() called
 with IRQs enabled
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Tomas Krcka <tomas.krcka@gmail.com>,
 linux-arm-kernel@lists.infradead.org,  nh-open-source@amazon.com, Tomas
 Krcka <krckatom@amazon.de>, Thomas Gleixner <tglx@linutronix.de>, Hagar
 Hemdan <hagarhem@amazon.com>,  linux-kernel@vger.kernel.org
Date: Mon, 30 Dec 2024 18:01:47 +0000
In-Reply-To: <86frm5p06l.wl-maz@kernel.org>
References: <20241230134903.84613-1-krckatom@amazon.de>
	 <86h66lp7nn.wl-maz@kernel.org>
	 <69ce753062e2325ff89f93465f0830941c9f4a86.camel@infradead.org>
	 <86frm5p06l.wl-maz@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-1YQiWGBcxYrV8luHQ8gE"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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


--=-1YQiWGBcxYrV8luHQ8gE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-12-30 at 17:09 +0000, Marc Zyngier wrote:
> On Mon, 30 Dec 2024 15:21:38 +0000,
> David Woodhouse <dwmw2@infradead.org> wrote:
> >=20
> > [1=C2=A0 <text/plain; UTF-8 (quoted-printable)>]
> > On Mon, 2024-12-30 at 14:28 +0000, Marc Zyngier wrote:
> > >=20
> > > Two problems here:
> > >=20
> > > - there is no "From Tomas Krcka <krckatom@amazon.de>" at the beginnin=
g
> > > =C2=A0 of the patch, which is needed since you are posting from a gma=
il.com
> > > =C2=A0 address
> > >=20
> > > - there is no SoB using your gmail.com address, which is needed since
> > > =C2=A0 this patch appears to be from your Amazon doppelganger.
> >=20
> > The latter isn't needed if you have the former, surely?
>=20
> I don't see why we shouldn't have it. AFAIC, this is a different
> sender, and I'm pretty sure tglx applies the same policy.

Not in my experience. I send patches like this all the time and don't
recall anyone ever complaining. People often have to work around broken
corporate email but still want to have the authorship correctly
attributed.

In the git log you can find plenty of commits containing
'Link:.*lore.kernel.org.*dwmw2@infradead.org' which I sent from my own
address, for which the Author and SoB are both @amazon.

Let's see if I can find a tglx one...=20

https://lore.kernel.org/all/20240802135555.564941-2-dwmw2@infradead.org
which became https://git.kernel.org/torvalds/c/70e6b7d9ae3c6 for
example?

The point of the From: line at the top of the email body is to
*replace* the one in the header. Or put another way, the one in the
header is used as a fallback if there is no explicit From: in the body
of the message.

Documentation/process/submitting-patches.rst phrases it the second way:

The ``from`` line must be the very first line in the message body,
and has the form:

        From: Patch Author <author@example.com>

The ``from`` line specifies who will be credited as the author of the
patch in the permanent changelog.  If the ``from`` line is missing,
then the ``From:`` line from the email header will be used to determine
the patch author in the changelog.

> > I've lost count of the number of patches I've posted over the decades
> > from my function non-corporate email address, just using a From: and
> > Signed-off-by: in the body for my work address. We've always accepted
> > that, and git-am does the right thing (discarding the actual From:
> > address from the headers of the email).
>=20
> Is that the royal 'We'?


Nah, it's been a while since I've been an active maintainer of anything
and applying patches from email. :)

--=-1YQiWGBcxYrV8luHQ8gE
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTIzMDE4MDE0
N1owLwYJKoZIhvcNAQkEMSIEICtx3uOusfUDL3VOE9geXu1ANPaVYb2PkfZRL7YB8WTsMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAmFnRg1CkwF41
CM098a8XJGp5rqgxWbdLfA4162JMBhbzTB40cuVefTTzQQYFHniZ5OrzsAXrtTcOuEmeBxQaD5WO
bWL5lpkCcUNyyfZfbA5e6snYQI39U7k7Zok/eNIPPwOgt2wRDnbHvRVYrwfMICaLa24EcKS1s1nD
f7WWOcmObafQhEPE2pLrK6Shax9P/VsHXX2LrrQfCIUVaQ3/hLQoEvA59a3gE2JY2PGieufD7KkV
fHSvytovLKiUnx0hyZ9AUW3ph4a8kyYCnkv/gQ8KP1c0cV0iZdaMoCKwqUCtg24aLS0uZH4EaoiQ
9iEix3lJXlxsxjoW/k9Gk5wn8YriW0mc6E25/XW5nRZqesxczdHbHLmuzIUC0jJuRTWVwHpCXeK2
TU8bcpuT/mc2JVM/k8IXLFRGu46aB4e4mADSEZtKbMG93S4XhRIYE7kCrMbgLAMvNoRyvVA2vRhf
frK03G5XytpYJKwiApr2Q56EbCkKoYBs02ohczdyLlTz0n2S/Yn397YYTgHM+d5RttjlYPzhD9L/
Bljo5cm0kc+U3gtaNMKS5cDTJ8cgTMa5asPKUS4GArCLYVIGSd9le37STJP7qI/dDZdTwVQRoJJm
cPMSDRGt2WJnzeKkSRPwTpc+p3hFjs+m8xWguDhgyDD4bIVA9mOYk8pafIoIn88AAAAAAAA=


--=-1YQiWGBcxYrV8luHQ8gE--

